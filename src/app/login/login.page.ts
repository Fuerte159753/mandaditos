import { Component, OnInit } from '@angular/core';
import { AuthService } from '../auth.service';
import { NavigationExtras, Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.page.html',
  styleUrls: ['./login.page.scss'],
})
export class LoginPage {
  email: string = '';
  password: string = '';

  constructor(private authService: AuthService, private router: Router) { }

  ngOnInit() {
  }

  login() {
    this.authService.login(this.email, this.password).subscribe(response => {
      if (response.success) {
        if (response.tipo == 0) {
          if (response.code == 0){
            this.router.navigate(['/cliente'],{ queryParams: { C: response.id } });
          } else if(response.code ==1){
            this.router.navigate(['/verificar'], { queryParams: { C: response.id } });
          }
        } else if (response.tipo == 1) {
          this.router.navigate(['/repartidor']);
        }
      } else {
        console.log("Inicio de sesión fallido. " + response.message);
      }
    }, error => {
      console.log("Error al intentar iniciar sesión. " + error.message);
    });
  }
}
