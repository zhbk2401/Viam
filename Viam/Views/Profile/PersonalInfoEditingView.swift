import SwiftUI
import PhotosUI
import UIKit

struct PersonalInfoEditingView: View {
    @EnvironmentObject var coordinator: Coordinator
    @Bindable var user: UserInfo
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var photoLoadErrorMessage = ""
    @State private var showPhotoLoadError = false
    @FocusState private var focusedField: Field?
    
    private enum Field: Hashable {
        case firstName
        case lastName
        case email
        case phone
    }
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 15) {
                PhotosPicker(selection: $selectedPhoto, matching: .images) {
                    VStack(spacing: 10) {
                        avatarImage
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 140, height: 140)
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                            .overlay {
                                Circle()
                                    .stroke(.secondary.opacity(0.3), lineWidth: 1)
                            }
                            .foregroundStyle(.secondary)
                            .overlay(alignment: .topTrailing) {
                                if user.avatarData != nil {
                                    Button {
                                        user.avatarData = nil
                                    } label: {
                                        Image(systemName: "trash")
                                            .foregroundStyle(.red)
                                            .background {
                                                Circle()
                                                    .fill(.ultraThinMaterial)
                                                    .frame(width: 32, height: 32)
                                                Circle()
                                                    .fill(.red.opacity(0.1))
                                            }
                                            .overlay {
                                                Circle()
                                                    .stroke(.secondary.opacity(0.4), lineWidth: 1)
                                                    .frame(width: 32, height: 32)
                                            }
                                    }
                                    .buttonStyle(.plain)
                                    .offset(x: -5, y: 5)
                                }
                            }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 10)
                    .animation(.bouncy, value: user.avatarData)
                }
                .buttonStyle(.plain)
                
                InputField("First Name") {
                    TextField("First Name", text: $firstName)
                        .textFieldStyle(.plain)
                        .textInputAutocapitalization(.words)
                        .focused($focusedField, equals: .firstName)
                }
                
                InputField("Last Name") {
                    TextField("Last Name", text: $lastName)
                        .textFieldStyle(.plain)
                        .textInputAutocapitalization(.words)
                        .focused($focusedField, equals: .lastName)
                }
                
                InputField("Email") {
                    TextField("Email", text: $email)
                        .textFieldStyle(.plain)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .focused($focusedField, equals: .email)
                }
                
                InputField("Phone") {
                    TextField("Phone", text: $phone)
                        .textFieldStyle(.plain)
                        .keyboardType(.phonePad)
                        .textContentType(.telephoneNumber)
                        .focused($focusedField, equals: .phone)
                }
            }
            .padding()
            .onTapGesture {
                focusedField = nil
            }
        }
        .dismissKeyboardOnTap()
        .scrollDismissesKeyboard(.interactively)
        .scrollContentBackground(.hidden)
        .navigationTitle("Edit Personal Info")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save", systemImage: "checkmark") {
                    focusedField = nil
                    user.name = normalized(firstName)
                    user.surname = normalized(lastName)
                    user.email = normalized(email)
                    user.phone = normalized(phone)
                    
                    coordinator.goBack()
                }
                .buttonStyle(.borderedProminent)
                .tint(.accent)
            }
        }
        .onChange(of: selectedPhoto) { _, newValue in
            guard let newValue else { return }
            Task {
                do {
                    guard let data = try await newValue.loadTransferable(type: Data.self) else {
                        await MainActor.run {
                            photoLoadErrorMessage = "Unable to load selected image."
                            showPhotoLoadError = true
                            selectedPhoto = nil
                        }
                        return
                    }
                    
                    guard let image = UIImage(data: data) else {
                        await MainActor.run {
                            photoLoadErrorMessage = "Selected file is not a valid image."
                            showPhotoLoadError = true
                            selectedPhoto = nil
                        }
                        return
                    }
                    
                    let compressedData = image.jpegData(compressionQuality: 0.85) ?? data
                    await MainActor.run {
                        user.avatarData = compressedData
                        selectedPhoto = nil
                    }
                } catch {
                    await MainActor.run {
                        photoLoadErrorMessage = "Failed to import image: \(error.localizedDescription)"
                        showPhotoLoadError = true
                        selectedPhoto = nil
                    }
                }
            }
        }
        .onAppear {
            firstName = user.name ?? ""
            lastName = user.surname ?? ""
            email = user.email ?? ""
            phone = user.phone ?? ""
        }
        .alert("Photo Error", isPresented: $showPhotoLoadError) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(photoLoadErrorMessage)
        }
        .gradientBackground(tinted: true)
    }
    
    private var avatarImage: Image {
        if let avatar = user.avatar {
            return Image(uiImage: avatar)
        } else {
            return Image(systemName: "person.crop.circle")
        }
    }
    
    private func normalized(_ value: String) -> String? {
        let trimmed = value.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.isEmpty ? nil : trimmed
    }
}
