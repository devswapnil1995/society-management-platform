import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class AuthApiService {
  private baseUrl = 'https://localhost:44392/api/auth'; // adjust

  constructor(private http: HttpClient) {}

  login(data: { email: string; password: string }) {
    return this.http.post(`${this.baseUrl}/login`, data);
  }
}