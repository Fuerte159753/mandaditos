import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router, NavigationExtras } from '@angular/router';

@Component({
  selector: 'app-cliente',
  templateUrl: './cliente.page.html',
  styleUrls: ['./cliente.page.scss'],
})
export class ClientePage implements OnInit {
  mensaje: string = '';
  id: number = 0;
  nombreCliente: string = '';

  constructor(private route: ActivatedRoute, private router: Router) {}

  ngOnInit() {
    this.route.queryParams.subscribe(params => {
      if (params && params['C']) {
        this.id = params['C'];
      } else {
        const navigation = this.router.getCurrentNavigation();
        if (navigation && navigation.extras && navigation.extras.state) {
          this.id = navigation.extras.state['id'];
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

  us() {
    let navigationExtras: NavigationExtras = {
      state:{
        c: this.id
      }
    }
    this.router.navigate(['cliente/perfil'], navigationExtras);
    console.log("se dio click");
  }
  ped() {
    let navigationExtras: NavigationExtras = {
      state:{
        c: this.id
      }
    }
    this.router.navigate(['cliente/his-pedi'], navigationExtras);
    console.log("se dio click");
  }

  edit() {
    let navigationExtras: NavigationExtras = {
      state:{
        c: this.id
      }
    }
    this.router.navigate(['cliente/edit-p'], navigationExtras);
    console.log("se dio click");
  }

  logout() {
    this.router.navigate(['/login'])
    console.log("se dio click");
  }
}
