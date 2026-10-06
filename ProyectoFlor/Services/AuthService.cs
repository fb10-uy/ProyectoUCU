namespace ProyectoFlor.Services
{
    public class AuthService
    {
        private bool _isAuthenticated;
        private string? _userName;

        public bool IsAuthenticated => _isAuthenticated;
        public string? UserName => _userName;

        // Very simple check - in real app replace with secure validation
        public bool Login(string user, string password)
        {
            if (!string.IsNullOrWhiteSpace(user) && !string.IsNullOrWhiteSpace(password))
            {
                _isAuthenticated = true;
                _userName = user;
                return true;
            }

            _isAuthenticated = false;
            _userName = null;
            return false;
        }

        public void Logout()
        {
            _isAuthenticated = false;
            _userName = null;
        }
    }
}