import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { AuthService } from '@society/auth';

@Component({
  selector: 'login',
  imports: [FormsModule],
  templateUrl: './login.component.html',
  styleUrl: './login.component.css',
})
export class LoginComponent {
  email = '';
  password = '';

  constructor(private auth: AuthService) { }

  login() {
    this.auth.login(this.email, this.password).subscribe({
      next: (res: any) => {
        this.auth.saveToken(res.token);
        alert('Login successful');
      },
      error: () => {
        alert('Invalid credentials');
      },
    });
  }
}
