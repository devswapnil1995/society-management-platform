import { Component, OnInit, signal } from '@angular/core';
import { RouterModule } from '@angular/router';
import { NxWelcome } from './nx-welcome';
import { HealthService } from '@society/api-services';
import { MatButtonModule } from '@angular/material/button';

@Component({
  imports: [RouterModule, MatButtonModule],
  selector: 'app-root',
  templateUrl: './app.html',
  styleUrl: './app.css',
})
export class App implements OnInit {
  protected title = 'resident-portal';
  message = signal<string>('Loading...');
  constructor(private healthService: HealthService) { }

  ngOnInit() {
    this.healthService.getHealth().subscribe({
      next: (res) => (this.message.set(res)),
      error: () => (this.message.set('API not reachable')),
    });
  }
}
