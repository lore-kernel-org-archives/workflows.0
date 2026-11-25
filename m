Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648580;
	b=de1+ttoDIVUdDh+phZo5vEqr3nX86bmUOx6O7CvTEzvxXVxamIlF65fhYURut+FZjAsh
	 F/Is3FnyfkXIKmyDrSKoZ9T46nwNF4qRVfoWF+G0HrgKZvaD3TBGGhYjjmnVo6hkYJHHL
	 b6Yot8NZB2vKDTNotZUAZuNBE/UHHD7yEY2h9UWWpw2eoHjfkb1LQ8Fd7OXfRm6XNPFtk
	 UIZ2CPC4vc5LJgu8bAp98m3C+bbjHabQI76hrO8/E/XagWjgFRJtgxnATRkqQr1BNdufO
	 T46oL+DMXY3uauwD8huhm/kMlFRzOGyLn9NDc5lkOE3pCzGVMvvQGDxgB/s1ormvUfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=E8vKd1x4175mc7dp2xB6lAEMhr1F0E2ODkggdlQIUIE=;
	b=Vyzsc7uO5OrPbS6K7QQ3p5qdw26diUmjSRFDLtKP/eDw+TAmCglLGxAXnE8mE3h0re4n
	 22IJviiiPviO/DVnyYThAOGndJigpdlzR1es8taip16JYRMNCmM1MsqHZ0MlG8Li4FjKL
	 O3D3UO1kVMj/mMi5rOxEUpQ+YQh4Nu8KMoLY+zmU9RCmXr/XTUJdm7xCV8zKtALz2FG+b
	 RGMauLDGOwOVf7qLRba+lqhZMnny8EfVgoD9IojXvd68x+nHHjiI5iGq3/3TmdTIsmwCF
	 slVkcxv7nnC3qdsBXNCzgqKTI5eN8sa84Fvxgodqciowc1d0vr+mf5p+H+vpZbKOuTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKVIZ7Dv;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13187606A31E
	for <workflows@vger.kernel.org>; Wed, 25 Nov 2026 23:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13187606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jKVIZ7Dv
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b487f44ee0so2456154a91.0
        for <workflows@vger.kernel.org>; Wed, 25 Nov 2026 15:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648579; x=1796253379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E8vKd1x4175mc7dp2xB6lAEMhr1F0E2ODkggdlQIUIE=;
        b=jKVIZ7DvKZtbXaP2DWsG09+5JZ3RgD/mzAYzNjFfghXqE8SLLfTjgQVYyBObvfZCIE
         u46RPFKr8glGu10TadtWqkJSA+3yPwR6nZ7qoJY3i9sH2LNi4yvOq2SMZBS3h3J46CnL
         CkVwe0jjwltsnc7kUiZHEkusvRGEg86aCCiucpp/NAxej67F4qRP4AsCDV7CrqXlEadi
         I4ZJvss+NMW9r2Tp3r17lk6RoXBeo6dA/zcXSL3qyGEfzRDD6F/xUfn7zmYoNLHFv+0F
         D1ZFxvU3E62+cAleVRJ/ZhJhKRi3GTUlH8P58M9GUwU9apVhS2soKP335BgzHyB97ApV
         bMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648579; x=1796253379;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E8vKd1x4175mc7dp2xB6lAEMhr1F0E2ODkggdlQIUIE=;
        b=vbJ/eCizESJ0QVSRrbVPeEPpNjwY5j9Mu3ZyVbvhlLedX8n+mPStxiqhJrcytYljXW
         GrfdYK29o44zzJeo9OEZasmfn8Iv40tur7xIUY26FI2tT0lggkJWBo0ezZkofVvby5wD
         9iSqBSeXQDm5x4JvtOLjBHCOpvz/GSnYPTPgxIrQVkly/TEHqMzzobiEXHEJRcxSYiyC
         I91VbGLE7n2hi/wLJcwXcXmp6JuwIjxnRI6hCddqlnGao05HIlZhJr8zCViDVCthe+MZ
         shkZ+pC4VtYS7r6N3neAflyu1LYIEoqK8SfqutWvtfSwARwAWQef+ki4vG0ngB+xLIOS
         69uA==
X-Forwarded-Encrypted: i=1; AL+hErERXM16h4rvClzgW4Yv6bByK1lpNXWTXfFcXRQIpBZ/fCrYRj1DIlWmgCIvakmoEHiOPGtTKzVXraI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8K8iXttnkB2r6YWBXShv55ErNMRzPK3FCgqKn4qEDYEQbCn+Nk
	rPv17L/3+nYoKc037SWxn2WBOwN1FBV6cRuLpENmDU+p2qlI0EnKkGzjxxYZtY9y
X-Gm-Gg: AZFdTZeSveDgynxcUO7f2NVTUVGOQxB/MCNCFqHPeoykO08FtE+cZKq8f503fGXbeRq
	bc5bP7D4LJQTIilXBi9+OIbCZXor7eOQyEkzcRmGDDvFwQdpcg5sc+dQoW3Hft4sILp8j7YMBSB
	pyTKc1tsGloWmw6n6+I09TABFPBY4LT2lNH8R6TXbGwpJ+xvCVYFs2PHTPXX8h+igY7wocHfPNB
	2BJ15nbdek1Jv/S5IPQCh6XQXP/83Ne6cBnQwwZk7iLsRWH45BjuqkXBj9/gPreaceMSN9yuAbj
	enP6JeVhGIFHFwurxuQ6uZzZFJ6pD6x0rmZBFzlOtqA6ldELb3DLcEdIIyuhBu6CUVOEgZHiqdh
	yllHbdOrha+Tr8lXRmuhazvsM7p5S+SptFsMnYFCWRaEsYualK8Nkg6FmVlvqYByMUerUxW/Cn5
	tC1bf0vwtEk8xTOVpv/HgXcpWD5Yz4zhxrNgm3GbONiiq/vbPApAclMoDtufPa+kNm9edJFiyPY
	1rbYGlGSIOfxnZh1wzRbs6P3qDdq+HiaBZoeuL9I/sGjlMffSGqWN8j6MlL3O8y1HimTx4VeKgC
	CZ1YzZjJeWEHXZTTmdrP+oP5chk=
X-Received: by 2002:a17:90b:2e49:b0:3b4:625:3d2f with SMTP id 98e67ed59e1d1-3b41cb212bfmr17680989a91.55.1795648579180;
        Wed, 25 Nov 2026 15:16:19 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41aab4729sm29282158a91.0.2026.11.25.15.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:16:18 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 5F6F6420A76D; Thu, 26 Nov 2026 06:16:14 +0700 (WIB)
Date: Thu, 26 Nov 2026 06:16:14 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Willy Tarreau <w@1wt.eu>, Jonathan Corbet <corbet@lwn.net>
Cc: skhan@linuxfoundation.org, Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	gregkh@linuxfoundation.org, Johan Hovold <johan@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v2 06/14] docs: security-bugs: do not send archives or
 binary attachments
Message-ID: <awdsPgHF6Y0xuSQI@archie.me>
References: <20261114190014.17826-1-w@1wt.eu>
 <20261114190014.17826-7-w@1wt.eu>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Yd+Dybq0Bn8RY/CL"
Content-Disposition: inline
In-Reply-To: <20261114190014.17826-7-w@1wt.eu>

--Yd+Dybq0Bn8RY/CL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 08:00:06PM +0100, Willy Tarreau wrote:
>  Please send **plain text** emails without attachments where possible.
>  It is much harder to have a context-quoted discussion about a complex
> -issue if all the details are hidden away in attachments.  Think of it li=
ke a
> +issue if all the details are hidden away in attachments. Archives (zip, =
tar,
> +etc.), binary files and documents (PDF, etc.) are never acceptable: when=
 a
> +reproducer is too large to be placed in the message, attach its source f=
iles
> +as plain text, and provide scripts that generate the required files (e.g=
=2E file
> +system images) instead of the files themselves. Think of it like a
>  :doc:`regular patch submission <../process/submitting-patches>`
>  (even if you don't have a patch yet): describe the problem and impact, a=
nd
>  list reproduction steps, all in plain text, then provide a proposed fix =
as

What if the issue can only be reproduced with specific binary files? Should=
 I
send it as e.g. ASCII-armored, OpenPGP-encrypted attachment or should I put
it somewhere else on the Internet (as privately-accessed file) and share its
link instead?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--Yd+Dybq0Bn8RY/CL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCawdsPgAKCRD2uYlJVVFO
o5lbAQCf+HFr4dpqHo/NjE5YZQjZhBumSvZxjxGVy4Bc+rJ6OwD/dQ9wDciflsw8
W5Gcx2EYKEBwUYE42WbwBHghakXKQQc=
=0aJI
-----END PGP SIGNATURE-----

--Yd+Dybq0Bn8RY/CL--
