GIANVI = {}

GIANVI.PED = {
    posx = 913.83, posy = -1273.37, posz = 26.089, heading = 74.7340,
    modelloped = 'mp_m_waremech_01',
}

GIANVI.CENTROLAVORI = {
    ["blip"] = {
        posx =  913.83, posy = -1273.37, posz = 27.089,
        nomeblip = "Centro Lavori",
        modelloblip = 214,
    }
}

GIANVI.FURGONE = {
    CostoDelFurgone = 500,

    ["Furgone"] = {
        modello = 'burrito',
        posx =915.0415 , posy = -1262.2831, posz = 25.5548, heading =150,
    }
}

GIANVI.MARKER = {
    dimensione = vector3(1.5, 1.5, 1.5),
    scala = vector3(0.7, 0.7, 0.7),
    colore = { r = 239, b = 255, g = 0 },
    tipo = 2,
    texture = nil,
    distanza = 2,
}

GIANVI.RPROGRESS = {
    cancellabile = false,
    tastopercancellare = 177,
    durata = 10000,
    colore = "rgba(187, 1, 184)",
    colorebg  = "rgba(0, 0, 0, 0.4)",
}

GIANVI.MINATORE = {

    ["Raccolta"] = {

        ["BLIP"] = {
          posx = -593.3020, posy = 2091.3540, posz = 132.1255,
          modelloblip = 532,
          nomeblip = "Miniera"
        },

        RaccoltaMinatore = {
            { x = -593.3020, y = 2091.3540, z = 132.1255},
        },
        itemRaccoltaMinatore = {
            "roccia",
        }
    },

    ["Processo"] = {
        ["BLIP"] = {
            posx = 1110.1001, posy = -2008.1312, posz = 31.0523,
            modelloblip = 532,
            nomeblip = "Processo Minatore"
          },
  
          ProcessoMinatore = {
              { x = 1110.100, y = -2007.9131, z = 31.0523},
          },

          item_Processo_Minatore = {
            "diamante",
            "argento",
            "bronzo",
            "oro",
          }
    }
}

GIANVI.TABACCO = {
    Centro = vec3(262.8832,6614.7695,29.7099),   --le coordinate della riga 70 e 75 devono essere uguali!!!!!

    ["Raccolta"] = {

        ["BLIP"] = {
         posx = 262.8832, posy = 6614.7695, posz = 29.7099,             --le coordinate della riga 70 e 75 devono essere uguali!!!
         raggio = 15.0,
          modelloblip = 286,
          nomeblip = "Raccolta Tabacco"
        },

        ["BLIPCIRCOLARE"] = {
            colore = 2,
            trasparenza = 128,
        },


        modellopianta = "prop_plant_fern_02a",

        item_Raccolta_Tabacco = 'tabacco',
    },

    ["Processo"] = {

        ["BLIP"] = {
            posx = 1994.2023, posy = 3793.1160, posz = 32.1808,
            modelloblip = 1,
            nomeblip = "Processo Tabacco"
          },
  
          ProcessoTabacco = {
            { x = 1994.5710, y = 3792.6936, z = 32.1808},
        },

        item_Processo_Tabacco = "sigarette"
    },

}


GIANVI.FALEGNAME = {
    ["RACCOLTA"] = {

        ["BLIP"] = {
            posx = -554.4142, posy = 5371.9058, posz = 70.2685,
            modelloblip = 1,
            nomeblip = "Raccolta Falegname"
          },

        RaccoltaFalegname = {
            { x = -554.4142, y = 5371.9058, z = 70.2685},
            { x = -555.1708, y = 5369.3325, z = 70.2774},
        },

        item_Raccolta_falegname ={
            "tronchilegno",
        }
    },

    ["PROCESSO"] = {
        ["BLIP"] = {
            posx = 1069.9553, posy = -2005.7192, posz = 32.0832,
            modelloblip = 1,
            nomeblip = "Processo Falegname"
          },
        ProcessoFalegname = {
            { x = 1069.9553, y = -2005.7192, z = 32.0832},
        },

        item_Processo_falegname = {
            "assilegno",
        }
    }

    
}

GIANVI.VENDITA = {
    item_da_vendere = {
        {nome = "assilegno", prezzo = 10}, 
        {nome = "sigarette", prezzo = 5},
        {nome = "diamante", prezzo = 50},
        {nome = "oro", prezzo = 30},
        {nome = "argento", prezzo = 20},
        {nome = "bronzo", prezzo = 15},
    }
}

GIANVI.NOTIFICHE = {
    ["1"] = "Non hai abbastanza soldi",
    ["2"] = "Recati prima al centro impieghi",
}

GIANVI.usa_esx_notifica = false


-- Imposta questa opzione su true se vuoi usare un altro sistema di notifiche
GIANVI.usa_notifica_custom = true

GIANVI.notifica_custom = "krs_notifica:manda"

