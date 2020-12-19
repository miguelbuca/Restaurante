if (!sessionStorage.dataUser) {
  location.replace("../home/index.html");
}

let { usuario, pessoa } = JSON.parse(sessionStorage.dataUser);

var _util = {
  isNormalUser: usuario.acesso == "normal",
  isMansterUser: usuario.acesso == "manster",
  isAdminUser: usuario.acesso == "admin",
  isSocioUser: pessoa.MEMBROASSOCIADO_id ? true : false,
  isCanilUser: !!usuario.id_canil,
  isSocioUserOnly:
    pessoa.MEMBROASSOCIADO_id && !usuario.id_canil ? true : false,
  isCanilUserOnly:
    !pessoa.MEMBROASSOCIADO_id && usuario.id_canil ? true : false,
  userData: {
    pessoa: { ...pessoa },
    usuario: { ...usuario },
  },
  gratis: {
    maxSocio: 1,
    maxCanil: 15,
  },
  func: {
    isSocioUser: (item) => {
      return item.MEMBROASSOCIADO_id ? true : false;
    },
    isCanilUserOnly: (item) => {
      return !item.MEMBROASSOCIADO_id && item.USUARIO_id_canil ? true : false;
    },
    isSocioUserOnly: (item) => {
      return item.MEMBROASSOCIADO_id && !item.USUARIO_id_canil ? true : false;
    },
    usuarioGet: (item) => {
      let {
        USUARIO_acesso: acesso,
        USUARIO_id: id,
        USUARIO_id_canil: id_canil,
        USUARIO_id_pessoa: id_pessoa,
        USUARIO_senha: senha,
        USUARIO_username: username,
      } = item;

      return {
        id,
        id_pessoa,
        acesso,
        username,
        senha,
        id_canil,
      };
    },
  },
  getLocalData: (data) => {
    return new Date(data).toLocaleDateString("pt-PT", {
      day: "numeric",
      month: "long",
      year: "numeric",
    });
  },
};
