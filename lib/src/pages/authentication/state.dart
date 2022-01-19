enum AuthenticationState{
  loading, // Procurando o user
  loggedIn, // Usuário tem uma sessão salva
  loggedOut, // Usuário não tem uma sessão salva
}

/// Estado do registro da conta
enum UserAccountCreationState {
  notRegistered, // Vai para a página de pre-registro
  preRegistered, // Vai para a página de registro completo
  registrationCompleted, // Vai para a home
}