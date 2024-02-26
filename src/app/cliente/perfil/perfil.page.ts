import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router, NavigationExtras } from '@angular/router';
import { AuthService } from 'src/app/auth.service';

@Component({
  selector: 'app-perfil',
  templateUrl: './perfil.page.html',
  styleUrls: ['./perfil.page.scss'],
})
export class PerfilPage implements OnInit {
  mensaje: string='';
  Id: string = '';
  cl: any = {};

  constructor(private router: Router, private route: ActivatedRoute, private authService: AuthService,) { }

  ngOnInit() {
    this.route.queryParams.subscribe(params => {
      if (params && params['c']) {
        this.Id = params['c'];
      } else {
        const navigation = this.router.getCurrentNavigation();
        if (navigation && navigation.extras && navigation.extras.state) {
          this.Id = navigation.extras.state['id'];
        }
      }
    });

    const hora = new Date().getHours();
    if (hora >= 0 && hora < 12) {
      this.mensaje = 'Buenos Días';
    } else if (hora >= 12 && hora < 18) {
      this.mensaje = 'Buenas Tardes';
    } else {
      this.mensaje = 'Buenas Noches';
    }
  }
  Back() {
    this.router.navigate(['/cliente'], { queryParams: {i: this.Id}});
  }

  oc() {
    this.authService.per(parseInt(this.Id)).subscribe(
      response => {this.cl = response;},
      error => {console.error('Error al obtener el perfil del cliente:', error);});
  }
}
