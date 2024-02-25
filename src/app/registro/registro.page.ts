import { Component, OnInit } from '@angular/core';
import { rutas } from './rutas';

@Component({
  selector: 'app-registro',
  templateUrl: './registro.page.html',
  styleUrls: ['./registro.page.scss'],
})
export class RegistroPage implements OnInit {
  rutas: string[] = rutas;

  constructor() { }

  ngOnInit() {
  }

}