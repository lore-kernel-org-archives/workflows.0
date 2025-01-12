Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7661BAEDC;
	Sun, 12 Jan 2025 15:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736697073; cv=none; b=LC+wA8DYorVZBgaf0AriLsArxR4BMaVeaUubHm6v4lxJdWMe6bdk4R8MxdHG2nF2paH0TaLAP8g9QvcR7RlAbpvWHOPap2eF4CkvnuPAR6m4WMcjlUIDcooYStz2IAjYjPCSsx3V3DALBr2p7JNzkkNbDZFBnmJhJ2WOPkOpyJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736697073; c=relaxed/simple;
	bh=CAjVSJwg2hQJBUdPPkdWwoqTmFKoP7sCht21kA+Dvtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tnr/3uKebm6rcL6QrfJRJz+ypnu9/bV0MlRg72PAC4PxZnJulxFjXwm9gthVabsFludJ6IbDXvNLgoOu0c8C4GIMfEn8dAYNkzPouRf4Gp68LV+6ZvDd7hcOAdm6ysAGlW/cA4yNWC4y3AUievhkyYGSODW/hQ7gyMObOlda3mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa69107179cso676267766b.0;
        Sun, 12 Jan 2025 07:51:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736697070; x=1737301870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojo6rpVsQOShQmgPfJGcLHfKrOA2VqG0QBnNPGXTc9w=;
        b=cb+2TYyMkC/iiETCjlKULPCjfiVvqnJ5pzKmCnisVUSvLEaDI0LYC5j+Vgo5WXc4d8
         XAoapUtO07bF/JpeWi6r7JXaOr9iDp23kx7PYkiQhv4WtCMoqoAXtIww2GUtA1jZwn11
         EyDVH0EpJ5lSOTAe+mf2N2E4OvRFZuyBL8s/+VOj/ywbi676yXh2+NMnNtjeapDEwm+a
         3DJ99rSF/UJO4auyHh5Z/BbHQZWvaUzjWHG3Y2BASwu3/FBdZsuD1KJyMCEnKvXbUGj1
         ayeieCZzcKM+MyeAsCm7OtQt0ie0cSyfJDUUJLlIaNhr6l+0W7VypvB+ZnuHZTGF0AXc
         Y7uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUwqbPut+N5STw8NAnQDJHnwfeKNNTlXchAwNGCRC1F3yPwIKm6Z/Nb9KARIG5jHzZ4Ei7yaPXxEfx@vger.kernel.org, AJvYcCUWXBHR8gtC0yK8fgUpZPIrSUHBHyk8ZEIsEB0Axgiuk2SP1ek1JSTIOemkgHYtRoR0d6en6UJqjyc=@vger.kernel.org, AJvYcCV3CxWDYJlZ9bKkc6/v1+xUwuYCT2SbrHdui4BVPqm4KubLOoRRVd12XDkFJWjXRiTbBaL618UgGWHTBxp+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4y+VRk+ShaB1fsZU9kSRtXOqpndzmc407fAIdm9NQzro3OdEk
	IscGe415wbk1LWDVckGt1JobVWmuLIIqX45qN6UTApM5RSGb96ogcON2OA5qWfw=
X-Gm-Gg: ASbGnctdm+QUq05UUPUJgzbiEMHR3HH2l9X/PyXQ9bywiyXnjXe711Qgpkqxfl8E/QW
	uOU3ou6ST+pn3sPvj3Ewnzb9xMvfCvGHuDraS3f/WP4g6uyZh6n74EPBnmVmSBhoCI0Yvjufnfl
	C+a9p24FMbbbFwBd2Xe8Dh0GMzD9in5WtLT/bNy7LhBzGqPklBtToRB+StqkQSkFjC9VkXBjt5J
	20lBZjU7oNMK9ZoqUPW8TnCsJ3NCVG9P7IZ3V/cdf8k+hW5zxG4LUkBHgPEcNVAqIs2RA6oU1U5
	v0uRs1XwFMY=
X-Google-Smtp-Source: AGHT+IEGnUZND4N3UywLpGJw/USQH1GlQV6Yp/yTNat/BS8S9sif1gHW5w8UZ+3L2a9285ej9YjkIg==
X-Received: by 2002:a17:907:6d0e:b0:aaf:5c9:19f9 with SMTP id a640c23a62f3a-ab2ab6f3455mr1609669866b.27.1736697069487;
        Sun, 12 Jan 2025 07:51:09 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9563ae8sm387243066b.129.2025.01.12.07.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jan 2025 07:51:09 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d3cf094768so6239750a12.0;
        Sun, 12 Jan 2025 07:51:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUxhkST6HKD2Me9eUPrJBzzFCDRyDpxMg3Y324gezUC+eMrb4189OO+AuABxXkmNrewuYjtxaqpCpaJAbvE@vger.kernel.org, AJvYcCWblMoKjJQcyPGyMNYpXIIktozwKiojY7v1etW5JZNc6JNet+xyj/+BlN/SDjO8Ep0b52cylkYuUSU=@vger.kernel.org, AJvYcCXh7ZRh9jwJ+RT1Y4QGCGgJjecoFPislZyvRdhVh2H2HY1qJdtesL2HA7zkv4gXd/8W0iPD7E72U5RG@vger.kernel.org
X-Received: by 2002:a17:907:70c:b0:aa6:7d82:5411 with SMTP id
 a640c23a62f3a-ab2abc6ca52mr1659041866b.40.1736697069149; Sun, 12 Jan 2025
 07:51:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250112152946.761150-1-ojeda@kernel.org> <20250112152946.761150-3-ojeda@kernel.org>
In-Reply-To: <20250112152946.761150-3-ojeda@kernel.org>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 12 Jan 2025 10:50:32 -0500
X-Gmail-Original-Message-ID: <CAEg-Je81VAYecajUjYVJKBJUT+YqKemWsWEoWFgOcF=vtfPRPw@mail.gmail.com>
X-Gm-Features: AbW1kvbn33SbtjplUZmkNvnmbm5gMpbukWC4yMx1bRK1ShqczijYBGnS7iH4t3o
Message-ID: <CAEg-Je81VAYecajUjYVJKBJUT+YqKemWsWEoWFgOcF=vtfPRPw@mail.gmail.com>
Subject: Re: [PATCH 2/3] docs: submitting-patches: clarify difference between
 Acked-by and Reviewed-by
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Sami Tolvanen <samitolvanen@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, tech-board@groups.linuxfoundation.org, 
	Steven Rostedt <rostedt@goodmis.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Dan Williams <dan.j.williams@intel.com>, "Darrick J. Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 12, 2025 at 10:30=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Newcomers to the kernel need to learn the different tags that are
> used in commit messages and when to apply them. Acked-by is sometimes
> misunderstood, since the documentation did not really clarify (up to
> the previous commit) when it should be used, especially compared to
> Reviewed-by.
>
> The previous commit already clarified who the usual providers of Acked-by
> tags are, with examples. Thus provide a clarification paragraph for
> the comparison with Reviewed-by, and give a couple examples reusing the
> cases given above, in the previous commit.
>
> Acked-by: Shuah Khan <skhan@linuxfoundation.org>
> Acked-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  Documentation/process/submitting-patches.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation=
/process/submitting-patches.rst
> index c7a28af235f7..7b0ac7370cb1 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -480,6 +480,12 @@ mergers will sometimes manually convert an acker's "=
yep, looks good to me"
>  into an Acked-by: (but note that it is usually better to ask for an
>  explicit ack).
>
> +Acked-by: is also less formal than Reviewed-by:.  For instance, maintain=
ers may
> +use it to signify that they are OK with a patch landing, but they may no=
t have
> +reviewed it as thoroughly as if a Reviewed-by: was provided.  Similarly,=
 a key
> +user may not have carried out a technical review of the patch, yet they =
may be
> +satisfied with the general approach, the feature or the user-facing inte=
rface.
> +
>  Acked-by: does not necessarily indicate acknowledgement of the entire pa=
tch.
>  For example, if a patch affects multiple subsystems and has an Acked-by:=
 from
>  one subsystem maintainer then this usually indicates acknowledgement of =
just
> --
> 2.48.0
>

This doesn't make sense as a distinction. What defines "thoroughly"?
To be honest, I think you should go the other way and become okay with
people sending Reviewed-by tags when people have looked over a patch
and consider it good to land.

To me, Acked-by mostly makes sense as a tag for people who *won't*
review the code, not for those who *will*. Blending Acked-by and
Reviewed-by just creates confusion.


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
