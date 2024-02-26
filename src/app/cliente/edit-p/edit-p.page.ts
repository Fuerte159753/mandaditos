import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router, NavigationExtras } from '@angular/router';
import { AuthService } from 'src/app/auth.service';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { rutas } from 'src/app/registro/rutas';
import { AlertController } from '@ionic/angular';

@Component({
  selector: 'app-edit-p',
  templateUrl: './edit-p.page.html',
  styleUrls: ['./edit-p.page.scss'],
})
export class EditPPage implements OnInit {
  mensaje: string = '';
  Id: string = '';
  originalData: any;
  editForm: FormGroup;
  nd: string = '';
  rutas: string[] = rutas;
  direcciones: any[]=[];

  constructor(private alertController: AlertController,private router: Router,private route: ActivatedRoute,private authService: AuthService,private formBuilder: FormBuilder // Inyecta FormBuilder
  ) {
    this.editForm = this.formBuilder.group({
      nombre: ['', Validators.required],
      apellido: ['', Validators.required],
      telefono: ['', Validators.required],
      ruta: ['', Validators.required],
      password: ['', Validators.required]
    });
  }
  ngOnInit() {
    this.route.queryParams.subscribe(params => {
      if (params && params['c']) {
        this.Id = params['c'];
        this.get(this.Id);
      } else {
        const navigation = this.router.getCurrentNavigation();
        if (navigation && navigation.extras && navigation.extras.state) {
          this.Id = navigation.extras.state['c'];
          this.get(this.Id);
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
    this.obdire()
  }


  get(userId: string) {
    this.authService.per(parseInt(this.Id)).subscribe(
      (response) => {
        this.originalData = response;
        this.editForm.patchValue({
          nombre: this.originalData.nombre,
          apellido: this.originalData.apellido,
          telefono: this.originalData.telefono,
          ruta: this.originalData.localidad,
          password: this.originalData.password,
        });
      },
      (error) => {
        console.error('Error al obtener los datos del usuario:', error);
      }
    );
  }
  update() {
    if (this.editForm.dirty && this.editForm.valid) {
      let hasChanges = false;
      Object.keys(this.editForm.value).forEach(key => {
        if (this.editForm.value[key] !== this.originalData[key]) {
          hasChanges = true;
        }
      });
      if (hasChanges) {
        this.authService.udp(this.Id, this.editForm.value).subscribe(
          (response) => {
          },
          (error) => {
            console.error('Error al actualizar el perfil:', error);
          }
        );
      } else {
        this.presentAlert('Alerta', 'Los datos deben ser diferentes a los originales');
      }
    }
  }
  new() {
    this.authService.in(this.Id, this.nd).subscribe(
      (response) => {
        this.nd = '';
      },
      async (error) => {
        const alert = await this.alertController.create({
          header: 'Error',
          message: 'Ocurrió un error al realizar la operación. Por favor, inténtalo de nuevo más tarde.',
          buttons: ['OK']
        });

        await alert.present();
      }
    )
  }
  async presentAlert(header: string, message: string) {
    const alert = await this.alertController.create({
      header: header,
      message: message,
      buttons: ['OK']
    });

    await alert.present();
  }
  obdire() {
    this.authService.obtr(this.Id).subscribe(
      (data: any[]) => {
        this.direcciones = data;
      },
      (error) => {
        console.error('Error al obtener direcciones:', error);
      }
    );
  }
  async dele(idre: number) {
    const alert = await this.alertController.create({
      header: 'Confirmación',
      message: '¿Estás seguro de que quieres eliminar esta dirección?',
      buttons: [
        {
          text: 'Cancelar',
          role: 'cancel'
        },
        {
          text: 'Eliminar',
          handler: () => {
            this.elimidire(idre);
          }
        }
      ]
    });

    await alert.present();
  }
  elimidire(idre: number) {
    this.authService.elimidire(idre).subscribe(
      (response) => {
      this.obdire()
      },
      (error) => {
        console.error('Error al eliminar la dirección:', error);
      }
    );
  }
  goBack(){
  }

}
