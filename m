Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B20ADDA9
	for <workflows@vger.kernel.org>; Sat, 25 Oct 2025 06:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761373039; cv=none; b=T1KqERoSkhTb7WLUDxejGCXwNZmC+B7zAD406XCxRzDYH5xtSEK6hippEA2+57CtqvmmSD5+MMBybEyTEzM9YOx4DRXgwT5mRa2HO4lrXZhY1fFHizLwDQJ7gdY5XxUuO1VuVjac4sOqWpXVUXkEQQ3wpMOivlaIRJF4vfNeq8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761373039; c=relaxed/simple;
	bh=cn1oi11LG/pF61ql1VCKF0X0phsVnfYnbM22lp/uDU0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KEimtH1iXyWpnTqpR4cMUFcqOr9u1hl4jute2Zm+k+ieonV3C+q4GKtJCxH9bpVpsSXgKCgeRiPRTMKUrPJH3WFfmd8DAH3nhXJAc9YXzYw/lG9k8oxQnXIh6yGGVGk0zFmK8lj7/xxYZz8Mis1lbbdV3i+fmJZBwC783MaySfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRqzPBq+; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRqzPBq+"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7a4176547bfso119620b3a.2
        for <workflows@vger.kernel.org>; Fri, 24 Oct 2025 23:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761373037; x=1761977837; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6p7GK3VvKhA8P74byFxrt2YZTTWqdb0ZlXuHY4d+0hM=;
        b=JRqzPBq+QgOktLnq13zp5shoPGgLCx7woOK62GSPQpTXNtW58jLvS2lWsUc87Qn2wO
         kd10em+94SBSSXxpLljambxISaKONWmIqvUlonovmcS95abp9AmY/YKl8v/0Ets0Xg3E
         fGiJnvEVcRjCkCQETTL2/xHsQ2gKU+rfyOg7fCJF+3SikciGYsCp6N97rGRabtU8uH0H
         0fouLrCQRQysWiD0/+6dIdMcZlpDYo2n8KPTL2ojwvqak4mvAhimOj52s07AJsYVDYjL
         2VE9UzCEqmjmUxhyZ7wHwAFrZwxe2hVuMVh0vRh8agR7M/9EJD0qrN+m6o0rsuavuU/o
         4LNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761373037; x=1761977837;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6p7GK3VvKhA8P74byFxrt2YZTTWqdb0ZlXuHY4d+0hM=;
        b=IEyo6irVoos3WanWSCHoKxQ2PhqbF0R8cqcVJzgRGY2A7Eg0ZKWLAEt3d8oQZ0xj+w
         iWgWvb9RcSnS/YCSJQXjFLDCr/fOKANyvAT18xeggvCOdbiiG1asTNNHs70oVD9j6AMs
         e4wsJtpnCAMfqBNj/vlCEUQ22QS0WijDXldvZFgzEvWVeNfGJs9cLjTyPIdSP4NNfhns
         hGPbR1fHCSA1ISjMf9GaniovwcgWaICr0UyyFuPyBJIJnxXS7rVKRtBQcjyLsI9eb6Uo
         dULsaDshCrDyE/dtFgp3n6DMra8ESvEsg96frqlKSPyXb/QVEhFfCq1NcgGneaq6qtrI
         Hhig==
X-Gm-Message-State: AOJu0Yy/8r9tmPBjv5cl7LstTQVrmeMr6154wdFH4/MRvqboWqt8hWyO
	MDVNDRG2osWqSBb54nQ1Dc/Xh1oLqlCPpfnC4KkDFk19uCTCdNN/18Kn
X-Gm-Gg: ASbGncvsuWqPA7p/WagF2oSD4Kyxl3NVni2UvcKnlZjF6ESubAC70rMglH5zt3aFJt3
	f+RQIGsRMFLtgUcu/84S2uhyv5KzrOPR+1iEykglAMFYFqA0vBnsg90fAY+pWQnk0k317a9Fnsf
	SBD8Edhmwhtp7/NCFEDcuVYNONlmWOEij+rhhBH75hmnPDrqj1x2dP4ku+P2usdwmsFg3um48Ba
	YRU10ItpAkoUTjLVqIlBu1m495yxGIwuLaCVlCTbtm+Xf2J6ZU0XG3QpYjUDnxiMUfibFMcbVuY
	fahYnoiSo0Kene4P6aASpJLxlxwoFBViV6ZQFeDsUZt5l2vQj9oET95m5PO6Nf/3ot2eSV8f5Io
	WRWGSTmitYLbPqoX1h5dPbu6WoUy4FI3ZQ+D10YrU4MhSfq/m3qD/FtvEtAF9J8P+Q1ZCVHNUMx
	QryXKo35CpEnlcMN0XSARW5zNDybg7K/+ggabo6Fdyjq/aEyUVA4L6kM24
X-Google-Smtp-Source: AGHT+IEnx65olDd4wUsKq9Ohdp5aWegEgeLRj2EY+h3wY1HJDJOM27r0YRmfqUrDPBEW/wTGvWKOoQ==
X-Received: by 2002:a05:6a00:2e26:b0:7a2:1b8a:ca22 with SMTP id d2e1a72fcca58-7a28685edf4mr5915593b3a.25.1761373036774;
        Fri, 24 Oct 2025 23:17:16 -0700 (PDT)
Received: from ?IPv6:2401:4900:88f6:d7b0:443:a828:b6ba:688d? ([2401:4900:88f6:d7b0:443:a828:b6ba:688d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414087587sm1158573b3a.58.2025.10.24.23.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 23:17:16 -0700 (PDT)
Message-ID: <14a56a50d5d8803bc822ae99fbe527755323623b.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] add check for pointers with __free attribute
 initialized to NULL
From: ally heev <allyheev@gmail.com>
To: Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Andy Whitcroft <apw@canonical.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>,
 David Hunter <david.hunter.linux@gmail.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Viresh Kumar	 <vireshk@kernel.org>, Nishanth
 Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,  linux-pm
 <linux-pm@vger.kernel.org>, dan.j.williams@intel.com
Date: Sat, 25 Oct 2025 11:47:09 +0530
In-Reply-To: <769268a5035b5a711a375591c25d48d077b46faa.camel@perches.com>
References: 
	<20251024-aheev-checkpatch-uninitialized-free-v2-0-16c0900e8130@gmail.com>
		 <20251024-aheev-checkpatch-uninitialized-free-v2-2-16c0900e8130@gmail.com>
	 <769268a5035b5a711a375591c25d48d077b46faa.camel@perches.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-10-24 at 11:01 -0700, Joe Perches wrote:
[..]
> > @@ -7728,6 +7728,12 @@ sub process {
> >  			ERROR("UNINITIALIZED_PTR_WITH_FREE",
> >  			      "pointer '$1' with __free attribute should be initialized\n" =
. $herecurr);
> >  		}
> > +
> > +# check for pointers with __free attribute initialized to NULL
> > +		while ($line =3D~ /\*\s*($Ident)\s+$FreeAttribute\s*=3D\s*NULL\b/g) =
{
> > +			WARN("NULL_INITIALIZED_PTR_WITH_FREE",
> > +			      "pointer '$1' with __free attribute should be initialized to =
a non-NULL address\n" . $herecurr);
> > +		}
> >  	}
>=20
> I think this a poor idea as almost all the instances where this
> initialization is done are fine.
>=20
> And there are a lot of them.
>=20
> $ git grep -P '\b__free\b.*=3D\s*NULL\s*;' | wc -l
> 490

Sorry for not checking this earlier. I looked at quite a few of them
none were real issues

>=20
> And what about these uses that depend on struct path members
> .mnt and .dentry being NULL.=20
>=20
> $ git grep -P '\b__free\b.*=3D\s*\{.*\}\s*;'
> fs/configfs/symlink.c:  struct path path __free(path_put) =3D {};
> fs/fhandle.c:   struct path path __free(path_put) =3D {};
> fs/file_attr.c: struct path filepath __free(path_put) =3D {};
> fs/file_attr.c: struct path filepath __free(path_put) =3D {};
> fs/namei.c:     struct path parent_path __free(path_put) =3D {};
> fs/namei.c:     struct path parent_path __free(path_put) =3D {};
> fs/namespace.c: struct path old_path __free(path_put) =3D {};
> fs/namespace.c: struct path path __free(path_put) =3D {};
> fs/namespace.c: struct path old_path __free(path_put) =3D {};
> fs/namespace.c: struct path path __free(path_put) =3D {};
> fs/namespace.c: struct path to_path __free(path_put) =3D {};
> fs/namespace.c: struct path from_path __free(path_put) =3D {};
> fs/namespace.c: struct path new __free(path_put) =3D {};
> fs/namespace.c: struct path old __free(path_put) =3D {};
> fs/namespace.c: struct path root __free(path_put) =3D {};
> fs/namespace.c: struct klistmount kls __free(klistmount_free) =3D {};
> fs/namespace.c: struct path fs_root __free(path_put) =3D {};
> fs/nsfs.c:      struct path path __free(path_put) =3D {};
> fs/nsfs.c:              struct path path __free(path_put) =3D {};
> fs/nsfs.c:      struct path path __free(path_put) =3D {};
> fs/overlayfs/params.c:  struct path layer_path __free(path_put) =3D {};
> fs/overlayfs/params.c:          struct path path __free(path_put) =3D {};
> fs/pidfs.c:     struct path path __free(path_put) =3D {};
> include/linux/path.h: * struct path path __free(path_put) =3D {};
> kernel/acct.c:  struct path internal __free(path_put) =3D {};     // in t=
hat order
> kernel/trace/trace_uprobe.c:    struct path path __free(path_put) =3D {};

These are not valid issues too
