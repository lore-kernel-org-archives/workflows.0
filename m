Return-Path: <SRS0=I4mM=YL=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0015CCA9EA0
	for <workflows@archiver.kernel.org>; Fri, 18 Oct 2019 16:11:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE6FF222D3
	for <workflows@archiver.kernel.org>; Fri, 18 Oct 2019 16:11:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nyu.edu header.i=@nyu.edu header.b="qDCRW8Qn";
	dkim=pass (2048-bit key) header.d=nyu-edu.20150623.gappssmtp.com header.i=@nyu-edu.20150623.gappssmtp.com header.b="mh2MnBcQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502701AbfJRQLd (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 18 Oct 2019 12:11:33 -0400
Received: from mx0a-00256a01.pphosted.com ([148.163.150.240]:44056 "EHLO
        mx0b-00256a01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2502620AbfJRQL1 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 18 Oct 2019 12:11:27 -0400
Received: from pps.filterd (m0142701.ppops.net [127.0.0.1])
        by mx0b-00256a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9IG6nOb120011
        for <workflows@vger.kernel.org>; Fri, 18 Oct 2019 12:11:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=date : from : to :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=20180315; bh=lHM5I0HSXYkBgOqGtJf0Eu9mn/sHMvw0BcNA/VVfY04=;
 b=qDCRW8Qns0HUszZeOSiA3P+nO6wO4BkzjDlzfFXHxUZYPp0Kb4Z4aGNJnw4K7B7gQ0lK
 pQ0p10br548ocPyt/Kw4gFxjeps52+U61pM1hpRIl8XoRFVuwxE9OmlTV0z2Eg1c/alJ
 Hmk85OHQfHQU9wCZ4QwYKieVLZByXr1sKRdoNqlnftB7ZZmIJF0yh4ClcpAizfgtaEqk
 3/MMw3W7rJihlf/gauhvfSoikko8ZGQ+MsmO3Hm+OlUhmVt3hbGbeqtE6XpFfIHEEhC7
 Ej9RZALRhiLZhd3HcRyulhUEEdUWS0AJx71lGi9z+HgPpWmS0w+dnjTUQrZacgf8Xviz 2Q== 
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
        by mx0b-00256a01.pphosted.com with ESMTP id 2vq7yvg6ph-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <workflows@vger.kernel.org>; Fri, 18 Oct 2019 12:11:25 -0400
Received: by mail-qk1-f197.google.com with SMTP id m189so1415740qkc.7
        for <workflows@vger.kernel.org>; Fri, 18 Oct 2019 09:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nyu-edu.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lHM5I0HSXYkBgOqGtJf0Eu9mn/sHMvw0BcNA/VVfY04=;
        b=mh2MnBcQzL97cXsZ8di63e639C45jvmMREFZJd2yyV3W3WJPubQeLKV61Zl92y0q1X
         TULFo5wAWmtpaKdNW2rB7EVXp3Yvc3DleI+sZs7E/OQ2i8OzCe9HsBPKQmjNf25g2IYB
         6Kw/PXWzGckx5a8Rm99vw7MaG6nZhbvLN+yubZ3UsqtiQG9z8JfnV2IUKAPzTBR4Lmqz
         r8eXk3s+ldrvgpz35corD73KJS6Ia3pLCFP1OmJdDAy7Ic4MzBli87OowZmcXzipl6xp
         opX0fBJvJQPwOv7dLrbnTFXyQV81QhpbHXoc3sY3RdstvNz58EtxdotqjV/hxxZ5Vtur
         RKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lHM5I0HSXYkBgOqGtJf0Eu9mn/sHMvw0BcNA/VVfY04=;
        b=lz1Q0XBcpPbASSZij6OHA6YYTQTq3v6gOVi1BYY/KBGXikolPSo8dyHIWbt0pDUD4N
         k6hdge9S9REn2JeF4qF+AaGzEfbkh2FBPPXMiqICbWUU1RvrK1kCcCH6lWjy3q2qzV1L
         Rg+CE8b3lSbn8Cw5TdZ+fCsbI/9CTEgp16TXQQ/kyk6OfSKP4ACjXy4ltXHgXaJLMiHc
         vp4sEoCkwc2vUh/GQRktPQO4yPKJOOvTiqRu5nDjrCVjJUxDidSOWFflLCIDVTDixVsA
         7mgtEsksztEYbr3rbNQTAOcXgbwEbJ95v6FaIlS8xWuA89/W/9Btvrew7PztVLyPn+X/
         MOKA==
X-Gm-Message-State: APjAAAUQyMPJ9dmhUYFFmpwNZ2ht1HewZLRBtJgrqInzfV6CtXmneNFD
        eU5tMpqy6x0s/qVdDpwwgZi1SjHoOPCQsL87Oq9PO3Ko7ChLA2pqyqYfxNE4tfJKMUXQ5kIZRfD
        8u+XDj7JDWx2BC3eS3E0=
X-Received: by 2002:a0c:fd63:: with SMTP id k3mr10484619qvs.185.1571415083967;
        Fri, 18 Oct 2019 09:11:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw9oseEn9vueF+r2BvG0eNlqZ8HAgBLbGeWx2SxOoEkwS2LgxoYX5R4GCU2LZuVLBZfQZc5bQ==
X-Received: by 2002:a0c:fd63:: with SMTP id k3mr10484594qvs.185.1571415083693;
        Fri, 18 Oct 2019 09:11:23 -0700 (PDT)
Received: from LykOS.localdomain (216-165-95-130.natpool.nyu.edu. [216.165.95.130])
        by smtp.gmail.com with ESMTPSA id q200sm3073239qke.114.2019.10.18.09.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 09:11:23 -0700 (PDT)
Date:   Fri, 18 Oct 2019 12:11:22 -0400
From:   Santiago Torres Arias <santiago@nyu.edu>
To:     Vegard Nossum <vegard.nossum@oracle.com>, Willy Tarreau <w@1wt.eu>,
        workflows@vger.kernel.org, Git Mailing List <git@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, Eric Wong <e@80x24.org>
Subject: Re: email as a bona fide git transport
Message-ID: <20191018161121.6qe5kkweh4u77gvn@LykOS.localdomain>
References: <b9fb52b8-8168-6bf0-9a72-1e6c44a281a5@oracle.com>
 <20191016111009.GE13154@1wt.eu>
 <20191016144517.giwip4yuaxtcd64g@LykOS.localdomain>
 <56664222-6c29-09dc-ef78-7b380b113c4a@oracle.com>
 <20191018155408.dk4tsjrne42ufpvv@LykOS.localdomain>
 <20191018160343.GB25456@chatter.i7.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5dbczkamho4hvge3"
Content-Disposition: inline
In-Reply-To: <20191018160343.GB25456@chatter.i7.local>
X-Orig-IP: 209.85.222.197
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 suspectscore=7 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910180146
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org


--5dbczkamho4hvge3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2019 at 12:03:43PM -0400, Konstantin Ryabitsev wrote:
> On Fri, Oct 18, 2019 at 11:54:09AM -0400, Santiago Torres Arias wrote:
> > > Seeing how large this signature is, I have to admit that I am partial=
 to
> > > Konstantin's suggestion of using minisign. This seems like something
> > > that could be added to git as an alternative to gpg without too much
> > > trouble, I think.
> >=20
> > I wonder how big the pgp payload would be with ed25519 as the underlying
> > algorithm. AFAICT, the payload of a minisign signature vs a signature
> > packet have almost the same fields...
>=20
> It's smaller, but it's not a one-liner. Here's a comparison using ED25519
> keys of the same length:
>=20
> minisign:
>=20
> RWQ4kF9UdFgeSt3LqnS3WnrLlx2EnuIFW7euw5JnLUHY/79ipftmj7A2ug7FiR2WmnFNoSacW=
r7llBuyInVmRL/VRovj1LFtvA0=3D
>=20
> pgp:
>=20
> -----BEGIN PGP SIGNATURE-----
>=20
> iHUEARYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCXaniFAAKCRC2xBzjVmSZ
> bHA5AP46sSPFJfL2tbXwswvj0v2DjLAQ9doxl9bfj9iPZu+3qwEAw5qAMbjw9teL
> L7+NbJ0WVniDWTgt+5ruQ2V9vyfYxAc=3D
> =3DB/St

Yeah, the discrepancy mostly comes from pgp embedding a timestamp and a
longer keyid (+a full keyid fingerprint in pgp 2.1+). Minisign keyids
are 8 random bytes, apparently.

It doesn't seem like an amazing win in terms of succintness, imvho...

Cheers!
-Santiago.

--5dbczkamho4hvge3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkDurc2QOttZVM+/zRo8SLOgWIpUFAl2p5CkACgkQRo8SLOgW
IpVFkg/+IC6+ElikT3WhkNyWtIvmLoqVxdpvuKUNADxO0zmUg1m+jzaAktuAwjP8
Sn3jXRIT5vBXy8i8T+dyF37Qxovha3FAx03UepPZwNA+mqB/PCIq5l+lC+hMjOUd
xf0cjRhzb7bg3TTn4tTvTq4wrLNNOgAsoU+JKuM4vLdz0BI6xHKjEDmEeyPa8Ez/
l16V2/qpiQjhL85KVCdZzHkNnXdAw1lSd/Wd/BH6n/fFL6Ng17JG0fLyBVMjKdn7
I5tChT/sEgoEqpY51YeX8oNhbEMK4b14Id/u/JBNOL+NX/+OkVoklMGgvKW5TiWj
/INAR786NEIRoFHGM+61tDWFJl4t1SoTpf8eFNEhrOeJyIcnXSB7FPXuBB1uD+++
iEbyJtuUFdLi0iVbJgv1rBxZNIc3DTWIfA0outUn5Y5NSgeXGBNhTMNHE5QsqHDF
/3OLDm+5jGMeN9iePb7Cbb/oxt118c4LUVShrN67LmwOQ0cSl353Ct5sXFXe3f59
mHKxM1+F94viKVIPLdi2Yz99lH9FZ5NPyskRAP0yZEDeu+bPyGkdn+2PaiDxGFOx
1XcoI5wMjQ+eR3eftjufbWIUm4C/jtxG978nBaXN8yf00omWDccI3+fodCXDE5Mj
RCnJ8qi3/SUOs2OCcSQaWxB3PmiUuPDP+OP5evNuJYXuAU5OtGA=
=MEhz
-----END PGP SIGNATURE-----

--5dbczkamho4hvge3--
