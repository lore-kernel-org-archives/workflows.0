Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E0D1E51D;
	Sun, 12 Jan 2025 16:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736699605; cv=none; b=EyvfKs0qXOHer1a9u7+LMgSxS8LCr3yLUgZfjjR1J7x5vKf8I1Be5FcjnS6U1h4N+JtUYB2yduOMrsTWpXBIdOGvY0aSC3iauO/e44jOOn6FqaUKqe05ex0CP14soO0S0FT0X3qIKuXOq+ZK6M2Uq92z0WCmZ/NPIaJYOozrR0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736699605; c=relaxed/simple;
	bh=XVqHpY3N9bg+00YKap6C+QuFblHD0Z37kdfroKcfoBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K4rSyKMT5lq3W11eH0peoXt4EAIUB9defKXCQnqFoDkbHBz0IyJ3bp261xgUDEQZp82pAxcU+tCVjxTrnIrR9HEXXcrWxQ/itpsfMZVK62VeZuIrb1TjRGukPfm5m1f1Zp+AxIh6ZkWaFw3OzCKONSTvHlet+hzZvmcNNf/V0rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MnkX8DdD; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnkX8DdD"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ee4b72d4d8so749511a91.3;
        Sun, 12 Jan 2025 08:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736699604; x=1737304404; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVqHpY3N9bg+00YKap6C+QuFblHD0Z37kdfroKcfoBc=;
        b=MnkX8DdD3PwUzNrLUWJJJyDHkQ+HNyxsgCitdpjNAKzG6UZTY8ECZfE504vHyRVFIo
         8+ceBQGr3TiK/AGtAzqsK83imtLs9cwirSIkCFFS2e5D9sVUte++7tUyMbzyAFlItIBd
         QLn8DknptXP7t0fvuCs4nrPZeht7d/1ctF9cgROEG8DEfMz2dJQujE7NpYZJApb+Nr7s
         IMoaqy9wmy3lrxs9MeI5PHSWScb9ArHv7we56Bz7JtbvRf/8PBaZFih9FUzM53Jk00cW
         1nxfRIzBz2THwOoCVHWKmUwgeK/5+iSx+HL7VquwxTjntiQh4bjprkEzyQQLITgsQmgu
         z1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736699604; x=1737304404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVqHpY3N9bg+00YKap6C+QuFblHD0Z37kdfroKcfoBc=;
        b=RmweMqwu/A1SfejSX1ZVT6sV9EUItG+ubZvg/0U5tw9sasNunrWX31s4KX0XIKcQg4
         1FIW3rKxVbZ8qy3FqhHdcIuRFxG7tILvkR52rTbtSF5UsqnAh1rbRQgVBYVO1nlmSoSB
         INo1PulE6I17sOTrZD4QHoQJ5fhde60W/wa9PxlH3KDhFFRD3sr1NquarWMa76BhcMcq
         wsRN6IGnvsVfLb3YPT4elR7tpY8quSalr8CW2GuHegGovbg1ENG09Gkwj9RxEPlnKaae
         6VXMYeDcy+rco2u0gSPyruTiRGA2ubwLL2disvhpgeJb13Qu1RoIxgu0HhTi8hmnb/JL
         OZBw==
X-Forwarded-Encrypted: i=1; AJvYcCUb+vXGFPSjODwLh09E75Y8mtKn9bI5nxV3LUC3U3aXp8CmC3Lfbn5Y6TSIZTbV8LFtLuByTaUfHtE=@vger.kernel.org, AJvYcCVYSnyoZodGBAaN5Zzlmn2OB8M2fYhIhgrFxUK4HGxuU7hQg57jCXSovHGC9xkgAr3I29PjysqdCvzh@vger.kernel.org, AJvYcCW8UJgqwxdSOHgQPRsfVxYGSPdGOkKAXi+jK1xaXcKpVs4TGibcpfQDw6YIqL5iLqBMFeB6Cbr08vrBHKS5@vger.kernel.org
X-Gm-Message-State: AOJu0YzUhs7UNx2V6uVo/0JwPGwMt9VeIm+MhVcr/+27oU27JS8dgfar
	0/u8S5sTsm7xZAfU6uRx02H+2UBg8Cq90q/8mxpaAqW0npMkGduhPj08y+3m5WP13hUa3qkgOmQ
	UwLRxATIAIz4z1aErIfQH5K69MdELw1Zi2SQ=
X-Gm-Gg: ASbGnctf4pOB+tZdU8tJZMIyQg1Rr4XSq7RE8EcxUUrXMwgfon5h2bGg7j9IWrVbjjj
	V7SLoOHvAMQh/GkyxjcTX5P8GO0bTCpkci9rhTA==
X-Google-Smtp-Source: AGHT+IF9qCroMjFPgvBrOcm4sTwu8DFr8c2pZOMN3ul1CkskTe9gK5SbLAJsB7sYZjuS8R9wMmOjKIpCXLy5qVlhxpo=
X-Received: by 2002:a17:90b:2f07:b0:2ee:f59a:94d3 with SMTP id
 98e67ed59e1d1-2f548e55126mr10017977a91.0.1736699603851; Sun, 12 Jan 2025
 08:33:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250112152946.761150-1-ojeda@kernel.org> <20250112152946.761150-4-ojeda@kernel.org>
 <CAEg-Je-Knta8BtYSbZgX8cZ9Gd-2cpDAUE83dCJZbTbqmSfcKA@mail.gmail.com>
In-Reply-To: <CAEg-Je-Knta8BtYSbZgX8cZ9Gd-2cpDAUE83dCJZbTbqmSfcKA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 12 Jan 2025 17:33:10 +0100
X-Gm-Features: AbW1kvaZe2CFc-6pU_Vov_pNC6aiqdn2dh03696kzpcBc1UaVJG0rucVMsTqMCA
Message-ID: <CANiq72nPJHW_2B34d4jScTuvFA=Ux+EszvLN-p=wwPd5sFt54Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] docs: submitting-patches: clarify that signers may
 use their discretion on tags
To: Neal Gompa <neal@gompa.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	tech-board@groups.linuxfoundation.org, Steven Rostedt <rostedt@goodmis.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Dan Williams <dan.j.williams@intel.com>, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 12, 2025 at 4:47=E2=80=AFPM Neal Gompa <neal@gompa.dev> wrote:
>
> A tag must not be dropped without the tag submitter's authorization.

Tags get routinely dropped, as the commit message explains. So we
cannot say "must not", sorry.

Even if that were not the case, tags are currently added/decided by
signers, not tag providers. This patch is trying to document how it
works today.

I understand it may feel bad to not have a tag applied, but it is
something normal in the current process. Tags are publicly archived
nevertheless, so e.g. one can still prove work to others.

I don't think misunderstandings about development processes mean
people is "rude": it may feel bad, but that does not mean others are
"rude" necessarily, unless they were rude in their manners or
something like that, which is not what is being discussed here.

Thanks for the quick review!

Cheers,
Miguel
