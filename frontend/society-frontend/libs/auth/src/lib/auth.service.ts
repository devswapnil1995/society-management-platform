import { Injectable } from "@angular/core";
import { AuthApiService } from "@society/api-services";

@Injectable({ providedIn: 'root' })
export class AuthService {
  private baseUrl = 'https://localhost:44392/api/auth';

  constructor(private api: AuthApiService) { }


  login(email: string, password: string) {
    return this.api.login({ email, password });
  }

  saveToken(token: string) {
    localStorage.setItem('token', token);
  }

  getToken() {
    return localStorage.getItem('token');
  }

  isLoggedIn(): boolean {
    return !!this.getToken();
  }

  logout() {
    localStorage.removeItem('token');
  }
}