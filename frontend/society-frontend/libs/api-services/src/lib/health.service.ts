import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root',
})
export class HealthService {
  private baseUrl = 'https://localhost:44392/api'; // adjust port

  constructor(private http: HttpClient) { }

  getHealth() {
    return this.http.get(`${this.baseUrl}/health`, {
      responseType: 'text',
    });
  }
}
