import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/auth.service';
import { Platform, AlertController } from '@ionic/angular';
import { ActivatedRoute, Router, NavigationExtras } from '@angular/router';


@Component({
  selector: 'app-his-pedi',
  templateUrl: './his-pedi.page.html',
  styleUrls: ['./his-pedi.page.scss'],
})
export class HisPediPage implements OnInit {

  pedidos: any[] = [];
  Id: string = '';

  constructor(private route: ActivatedRoute, private router: Router, private alertController: AlertController) { }

  ngOnInit() {
    this.route.queryParams.subscribe(params => {
      if (params && params['c']) {
        this.Id = params['c'];
      } else {
        const navigation = this.router.getCurrentNavigation();
        if (navigation && navigation.extras && navigation.extras.state) {
          this.Id = navigation.extras.state['c'];
        }
      }
    });
    /*
    this.route.queryParams.subscribe(params => {
      this.clienteId = params['idCliente'];
    });
    this.http.get<any[]>('https://mandaditos.proyectoinutvm.com/busqueda.php?cliente_id=' + this.clienteId)
    .subscribe(
      (data) => {
        console.log('Datos recibidos:', data); // Agrega este console.log
        if (Array.isArray(data) && data.length > 0) {
          this.pedidos = data;
        } else {
          this.pedidos = [];
        }
        console.log('Pedidos:', this.pedidos); // Agrega este console.log
      },
      (error) => {
        console.error('Error al obtener los pedidos', error);
      }
    );*/
  }
  navigateBackToClientePage() {
    let navigationExtras: NavigationExtras = {
      state:{
        c: this.Id
      }
    }
    this.router.navigate(['cliente'], navigationExtras);
  }
  getColorByEstado(estado: string): string {
    switch (estado) {
      case 'cancelado':
        return 'danger'; // Rojo
      case 'en espera':
        return 'warning'; // Amarillo
      case 'pendiente':
        return 'primary'; // Azul
      case 'entregado':
        return 'success'; // Verde
      default:
        return 'medium';
    }
  }
  eliminarPedido(pedidoId: string) {
    console.log('ID del pedido:', pedidoId);
    const url = `https://mandaditos.proyectoinutvm.com/cancelar_pedido.php?pedido_id=${pedidoId}`;
    console.log('URL con ID adjuntado:', url);

    const presentAlertRedError = async () => {
      const alertRedError = await this.alertController.create({
        header: 'Error de Red',
        message: 'Ha ocurrido un error de red. Por favor, verifica tu conexión e inténtalo de nuevo.',
        buttons: ['Aceptar']
      });
      await alertRedError.present();
    };

    const presentAlertPedidoCancelado = async () => {
      const alertPedidoCancelado = await this.alertController.create({
        header: 'Pedido Cancelado',
        message: 'El pedido ha sido cancelado exitosamente.',
        buttons: [
          {
            text: 'Aceptar',
            handler: () => {
              // Esperar un breve momento antes de recargar la página
              setTimeout(async () => {
                await window.location.reload();
              }, 500); // Por ejemplo, espera medio segundo (500 ms) antes de recargar
            }
          }
        ]
      });
      await alertPedidoCancelado.present();
    };
    const presentAlertError = async () => {
      const alertError = await this.alertController.create({
        header: 'Error',
        message: 'Error al cancelar el pedido. Por favor, inténtalo de nuevo.',
        buttons: ['Aceptar']
      });
      await alertError.present();
    };

    const alert = this.alertController.create({
      header: 'Confirmar Cancelación',
      message: '¿Estás seguro de cancelar este pedido?',
      buttons: [
        {
          text: 'Cancelar',
          role: 'cancel',
          cssClass: 'secondary',
          handler: () => {
            console.log('Cancelación del pedido cancelada');
          }
        },
        {
          text: 'Aceptar',
          handler: async () => {
            /*this.http.post(url, { pedidoId: pedidoId }).subscribe(
              async (response: any) => {
                if (response.success) {
                  console.log('Pedido cancelado exitosamente');
                  await presentAlertPedidoCancelado();
                  window.location.reload();
                } else {
                  console.error('Error al cancelar el pedido');
                  await presentAlertError();
                }
              },
              async (error) => {
                console.error('Error de red:', error);
                await presentAlertRedError();
              }
            );*/
          }
        }
      ]
    }).then(alert => alert.present());
  }

}
