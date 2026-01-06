Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E942DA762
	for <workflows@vger.kernel.org>; Tue,  6 Jan 2026 10:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767693642; cv=none; b=kXmOEwz/pNu60aYqxcYdG15cJbCl9NIm7jI0J8pramrrS7YeaWyprmtbGLBb4lBW5FpgN5PJJJopxSmyHDKgxMJJ3D58BeNC0s0anTAa+bqDdVG2KXg1iO7+rz8nNdKVK46EC2mNEm6cxUL/9DP42dFFL3jPkg99qKBOaHSZ7D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767693642; c=relaxed/simple;
	bh=OV029VvtzwenK2Ly9pZj4XbmmuOkWSnirncC/J2DEPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eRY8iLJ/8YiJ/z98L68EguzqVgy3Wjavj/UscGgPu/lbL/+k0KakU+VdCBFO6Tlj5/f+hm9GoD1ssSub05IxU27D+etYdL4FmOtHMvx/SX3Z4NqXhJG/EMav68B5f4KhGqS6BusYRVJwIrury4ZBJbS54xkF0QafpOqhxI7gmko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzoGTJmm; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzoGTJmm"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b7a02592efaso134451966b.1
        for <workflows@vger.kernel.org>; Tue, 06 Jan 2026 02:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767693639; x=1768298439; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95EIx7FPWdKOzYWlR4mc8qP1EVSqo+qRiR/GKIGkIO8=;
        b=fzoGTJmmmvk7aC3XlmPoKWWEKJ5Z1ddsXPSRpxBwVLNW4iV9o0eiXMICSYDmk9Hytb
         lMSVs8JF9ZwKFe9DrkiXHvasWoIaBduGaa1Or0h1UmMMhU/sD/s+g37xB/+2Eb4tmeZi
         GN8bFYnEs/Qxbcbq9ZdbawxNwTCE6qHU1HEW6fKObAa44BJv0iyTOklRjvZP3fBkNJzm
         kiD+djFyJsKAblhYmfyrNxWo61aq1uLeKHLjq9YcLE1qXeE5/3TAFoTX+iMaoAtXym6X
         8i3gTTa5urM2W/mGwp7OlSJBGouJOn3mW5BeIrBLlfYOdYDYNgpJ22uXcaNGXuEV9H0O
         rtrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767693639; x=1768298439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=95EIx7FPWdKOzYWlR4mc8qP1EVSqo+qRiR/GKIGkIO8=;
        b=FLjUlr1Wf7nVECsnBkxHwBqMTtrTd+IKABLqROuPPWGNgNtBckl83oh1C6j73sGU8/
         m+V3Y3DNZTumUpNjF2md7r+DwafgKYMWp0ILnlh+hqqHmwgCsuUsYYVDFbWI57wmSJiW
         ODw/4nXc706eiWqXAVyheHK88b/sxvIN6DJx0rdycuqLJme4VO8YN3aWLZuu8AiHFXli
         B+okRnSlWOUEEMPgKctfN3mfpCWgldHr5pmWFhIZ5Peh+2PMlrbV26DP+rMye1OaT9cb
         09FI6vziNEtbksKiM31r+Yx4BSEXpbEb+ia8L1IDtWMJBSir79j6aa3a5s2i9rbkvI4R
         BOAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVICYlRQN6a7Sig9rdV/KiZlLh5Wh7R6iVHG+Rm9Ew8YPY5ZbHLPeLvAW9SoDyP2z2iGyec24XJBYA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJrg1yAfH2Ex5mUMlcspDYZs0c7l3sbpBP5jshuAcu0gCGtDfV
	OiFOOBfC5LjN9jgOVFg38gTQRdN2QhnqWzB8YAKV3lnIz6Zo4RrGMJsLJo6xIitr8ZCAl4nRKhH
	4++yMJS6Ny4kd68KDbVw0nRB2+mZgVTI=
X-Gm-Gg: AY/fxX5XaEK20DuRuw7xLjXSNSXZcL9RZN8uDhvyHWlWDbtXfMb6ttPg5V9XyzKUMmp
	OWT3Mjk18jGerxBuwo1PWuGJQK9c2mQrcO9BYlfjmb2XXrET/Teq4YJeElE8B8WhXYhjIfJPf+7
	zEYK9GTuEOyhSp9wcegw+xOFvSbQDIY3Z4uAsWtOgu/NGeEoRQQTV4X3Y/oJDFKHnj1fYrMOd81
	xtqbAKL/pLO/F2D0qJXJXoH4ObPpPqbn+YL9spofNfUONgujJSRli8aNdHpGMSHvJ9hWEo=
X-Google-Smtp-Source: AGHT+IGnEhBwtL7o99LDF3BZRneSMXjC+uePbbR7SnLCe9X0mAWxOwEKON+G+k4g0dpynrWrgF45RQr9oNCpMP1opMc=
X-Received: by 2002:a17:907:3c8b:b0:b79:f734:4d66 with SMTP id
 a640c23a62f3a-b8426a68039mr292054666b.18.1767693639272; Tue, 06 Jan 2026
 02:00:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251226-docs_thunderbird-toggle-line-wrap-v2-1-aebb8c60025d@kernel.org>
In-Reply-To: <20251226-docs_thunderbird-toggle-line-wrap-v2-1-aebb8c60025d@kernel.org>
From: Sotir Danailov <sndanailov@gmail.com>
Date: Tue, 6 Jan 2026 11:00:27 +0100
X-Gm-Features: AQt7F2rnSHtYO0W0XhlnJjqq7gkdw9dzDeIoQAzJuhrOv-qksWnMB-W4P_3Lv9E
Message-ID: <CACYkWJ5btoFoP0vL-1QxuU45CfZEyK65vK6Wyo1QNXRmw79nqQ@mail.gmail.com>
Subject: Re: [PATCH v2] docs: process: email-client: add Thunderbird "Toggle
 Line Wrap" extension
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Giedrius_Statkevi=C4=8Dius?= <giedrius.statkevicius@gmail.com>, 
	Paul McQuade <paulmcquad@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, 
	Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 26, 2025 at 12:47=E2=80=AFAM Vincent Mailhol <mailhol@kernel.or=
g> wrote:
>
> [1] man git-format-patch -- =C2=A7Thunderbird
> Link: https://git-scm.com/docs/git-format-patch#_thunderbird
>
> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
> ---
> Changes in v2:
>
>   - Use the international URL (remove "fr/")
>
> Link to v1: https://lore.kernel.org/r/20251225-docs_thunderbird-toggle-li=
ne-wrap-v1-1-24794afa4abf@kernel.org
> ---
>  Documentation/process/email-clients.rst | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/process/email-clients.rst b/Documentation/proc=
ess/email-clients.rst
> index 84a2450bb6ec..b5377630a648 100644
> --- a/Documentation/process/email-clients.rst
> +++ b/Documentation/process/email-clients.rst
> @@ -324,7 +324,14 @@ To beat some sense out of the internal editor, do th=
is:
>
>    - Set ``mailnews.send_plaintext_flowed`` to ``false``
>
> -  - Set ``mailnews.wraplength`` from ``72`` to ``0``
> +  - Set ``mailnews.wraplength`` from ``72`` to ``0`` **or** install the
> +    "Toggle Line Wrap" extension
> +
> +    https://github.com/jan-kiszka/togglelinewrap
> +
> +    https://addons.thunderbird.net/thunderbird/addon/toggle-line-wrap
> +
> +    to control this registry on the fly.
>
>  - Don't write HTML messages! Go to the main window
>    :menuselection:`Main Menu-->Account Settings-->youracc@server.somethin=
g-->Composition & Addressing`!
>
> ---
> base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
> change-id: 20251225-docs_thunderbird-toggle-line-wrap-dbe39bcb650b

It's a practical alternative, I see no issue.

Acked-by: Sotir Danailov <sndanailov@gmail.com>  # As past commit author
