import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { AuthService } from 'src/app/auth.service';

@Component({
  selector: 'app-perfil',
  templateUrl: './perfil.page.html',
  styleUrls: ['./perfil.page.scss'],
})
export class PerfilPage implements OnInit {
  Id: string = '';
  cl: any = {};

  constructor(private router: Router, private route: ActivatedRoute, private authService: AuthService,) { }

  ngOnInit() {
    this.route.queryParams.subscribe(params => {
      this.Id = params['C'];
      this.oc();
    });
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
