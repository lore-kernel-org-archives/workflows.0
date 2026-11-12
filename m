Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794514340;
	b=dGzHwbZxwrq27+kbeXwYSh7fbL6VTB6s475PaD2GFyOLD84cahUk3XckPaQPJ0G+FGgL
	 gfvpFm/Ywl8+0WJqMk0vIZWJ7o3fFn5KIhUF8y9PbazVDkKKNgJtQJBc8Qsu8fMNeWTUo
	 QMjaDcTmcgKuVWnVHIxi5YHrRlj/S+G+MXo6qxJ/6bNd1O0MYzy8J67n28m3YMI2lG9cm
	 ZcO/gFAgc1gsQRRyCQlWpCCjZx0PDrpCgIr2tOuIRUgNGQJzDlgtLp9uNdo+/Y8y0Uaf8
	 JTijOgIY2NPEEm2oiOcZIIVM8SQ7kyW1mRR8LtFDTgB4BuUf623fFAJzQBUSdijIucQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794514340;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=eakRgnWHv93CEQPpJprbZeATRfmw83XT/BkhRlCQLg8=;
	b=vI/3P1U0o948Z+CAFZySd4qzhASMXQotBocNhCEMCyBk9KtxVdkMcK8FsgAcB1/i/5e0
	 r7jZY0aYwrSHW1X2bdlfACejS00jkAbif1osEXnpxlPIh7Nhm9V9hc2VWGJ+E5rZqnDd1
	 xCKhFfRefIFSZNmsLYJgl3tCBfbrYpxqG8BqY5aN3laLpCXhmx1Ueh3pRQiG6xEyx+Z4J
	 1WfKBd6C23wjsNlBSvESuCH1iZoau7gMxp8rRL6HWUNdLvKEH85nsNdJvUh0glRdzABzd
	 6gkwSpijhswcT2nCfXUzLh8ZwYqMQbVljGPqGcOLTVSjQa2QxM0YytQxcEGMDLsPT7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bSHbJVnv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04314606A880
	for <workflows@vger.kernel.org>; Thu, 12 Nov 2026 20:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bSHbJVnv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC581F000D4
	for <workflows@vger.kernel.org>; Thu, 12 Nov 2026 20:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794514339;
	bh=eakRgnWHv93CEQPpJprbZeATRfmw83XT/BkhRlCQLg8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bSHbJVnvKo5zci/a1AG3EHF0wmI3lxnUuv9gNNDuCIUa9Xii0VLak9IqJNPLZgz07
	 Ep6uTeYWFnkORVWYYXWAyg7SZgXCKfvNk6z/NhDifM4Id8WAepGw8vhSpVItzOqscD
	 TF2VhaDh2DH2yMOTWY94XPcZy9echX8uG/ncBVHz+DJB5Pr9MgK8ft8ydYXyix3mve
	 hWrCBu+M9W+3Ln+9mf4dO2kVpEd9Z//hls+ej6fWmz+gownoDGd2DyLr0VO7cJstov
	 /3YNA8WdNblZK+OsyjcZjgG5Ukde7JElh2g3+Jlod2YdTbI5vfAxx3cuANNhpcxa16
	 a74kXQpbTvR9w==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ae1fd4252fso1650431fa.0
        for <workflows@vger.kernel.org>; Thu, 12 Nov 2026 12:12:19 -0800 (PST)
X-Gm-Message-State: APuU4Z8usZhTzzTGPBg4UIsiduOP3MiEPKOrgSyXPpLJAlqCHfRZAXgI
	VT4rsM3VFchy/VYRX4H7qRvFn2xJnHhULMkdhiBWo/hP1gfaho+NQoPZ0ruuPrzTTqi2A5fNfHR
	0zNBvl6oNfjH+7O1g0bdytnya4dYV2lg=
X-Received: by 2002:a05:6512:1325:b0:5c1:4c83:ae37 with SMTP id
 2adb3069b0e04-5c1705faa61mr179985e87.2.1794514338096; Thu, 12 Nov 2026
 12:12:18 -0800 (PST)
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111225940.1573565-1-tytso@mit.edu> <20261111225940.1573565-2-tytso@mit.edu>
In-Reply-To: <20261111225940.1573565-2-tytso@mit.edu>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 12 Nov 2026 21:12:06 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jQh5o8rT0EDZ+zMXmPn8i0Dz+FoRK92OeYGeHbzrf4Lw@mail.gmail.com>
X-Gm-Features: AclHuK89jLhFcAKrJXWTO7te7t_zZMTV5xHcIHChc6as7m7NjdEkpvKrRplXSrU
Message-ID: <CAJZ5v0jQh5o8rT0EDZ+zMXmPn8i0Dz+FoRK92OeYGeHbzrf4Lw@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] agents: add infrastructure for agent resources
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: workflows@vger.kernel.org, ksummit@lists.linux.dev, 
	Sasha Levin <sashal@kernel.org>, Bradley Morgan <brads@mainlining.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Mark Brown <broonie@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Leon Romanovsky <leon@kernel.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Thorsten Leemhuis <linux@leemhuis.info>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Kees Cook <kees@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dan Carpenter <error27@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alexei Starovoitov <alexei.starovoitov@gmail.com>, 
	Julia Lawall <julia.lawall@inria.fr>, SJ Park <sj@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 12:00=E2=80=AFAM Theodore Ts'o <tytso@mit.edu> wrot=
e:
>
> From: Sasha Levin <sashal@kernel.org>
>
> Add agents/ as a home for skills and other resources for
> coding assistants. Describe the skill layout in coding-assistants.rst,
> together with the rule that skills only inspect and report, and add a
> MAINTAINERS entry covering the directory.
>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> Reviewed-by: Bradley Morgan <brads@mainlining.org>
> Link: https://patch.msgid.link/20261020161642.3713052-2-sashal@kernel.org
> Signed-off-by: Theodore Ts'o <tytso@mit.edu>

Fine with me, so

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  Documentation/process/coding-assistants.rst | 14 ++++++++++++++
>  MAINTAINERS                                 |  6 ++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/Documentation/process/coding-assistants.rst b/Documentation/=
process/coding-assistants.rst
> index 509dbf23a099..b8f2c74e46fc 100644
> --- a/Documentation/process/coding-assistants.rst
> +++ b/Documentation/process/coding-assistants.rst
> @@ -19,6 +19,20 @@ For guidelines on content generated by AI coding assis=
tants see:
>
>  * Documentation/process/generated-content.rst
>
> +Agent resources
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Skills for coding assistants live under ``agents/skills/``, one director=
y per
> +skill with a ``SKILL.md`` entry point in the `Agent Skills format
> +<https://agentskills.io/specification>`_. Each skill points at the proce=
ss
> +documents that apply to its task and adds only what assistants tend to g=
et
> +wrong.
> +
> +Skills inspect and report. They do not change files, create commits or t=
ags,
> +or send mail. A skill returns its result with the evidence for it, or sa=
ys what
> +is missing. Do not fill a missing result with a guess or a placeholder, =
and do
> +not finalize the work until it is resolved.
> +
>  Licensing and Legal Requirements
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 222b7fc2c3aa..eb348cc9588f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -734,6 +734,12 @@ F: Documentation/filesystems/afs.rst
>  F:     fs/afs/
>  F:     include/trace/events/afs.h
>
> +AGENT RESOURCES
> +M:     Sasha Levin <sashal@kernel.org>
> +L:     workflows@vger.kernel.org
> +S:     Maintained
> +F:     agents/
> +
>  AGPGART DRIVER
>  M:     David Airlie <airlied@redhat.com>
>  L:     dri-devel@lists.freedesktop.org
> --
> 2.53.0
>
>
