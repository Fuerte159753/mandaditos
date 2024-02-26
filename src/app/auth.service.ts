import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(private http: HttpClient) { }
  url = 'http://localhost/mandaditos/';

  login(email: string, password: string) {
    return this.http.post<any>(this.url + 'login.php', { email, password });
  }
  per(Id:number){
    return this.http.post<any>(this.url + 'perfil.php', { Id });
  }
  reg(registroData: any){
    return this.http.post<any>(this.url + 'registro.php', {registroData});
  }
  udp(id: string, newData: any){
    return this.http.post<any>(this.url+'editar_p.php', { id, newData });
  }
  in(Id:string, nd:string){
    return this.http.post(this.url+'agregar_direccion.php',{Id, nd});
  }
  obtr(Id:string){
    return this.http.post<any[]>(this.url+'ob_dire.php',{ Id });
  }
  elimidire(idre:number){
    return this.http.post(this.url+'elimi_dire.php',{idre})
  }
}
