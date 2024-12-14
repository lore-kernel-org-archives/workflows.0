Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FBD7E1
	for <workflows@vger.kernel.org>; Sat, 14 Dec 2024 16:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734193906; cv=none; b=M8mcoJaxaxhMPPb1/o1BhmML/m4eupxQJnCXdPV9ZHbga7QsYmoF2IoafgV+S9MV+GMJhjejnjDnGBBXdP8SeqjRdE9qgEAY19IVDb7Gg9AEm5f/3ON0nvXtrTJxnMV4MpmqU35CHdNGSHGn3lgYjgpLjvhHWhMlQPSfX/TOpQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734193906; c=relaxed/simple;
	bh=aNfapG6I/CUOP9Y8AfR2pHR5FECAZ7Mbd4YYU7awi0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=euk0L+NZRJDI36UMId1qzH/C+Ih1Bhh0MoesGgKQ7RDWnx/FAjTj4eVdM0qmo8lQfCuDi2s7SFXMoQDvrI0g+0Zjp7CyZN6jh0rzTuSkd/j8pFD+CKJ/Lio8SX7t2zlIrK+NzDeuMjSDdU6/MUY02oQfcSbsNqf2njGPMdn0Lds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Ra67mIeS; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Ra67mIeS"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d65b4ae632so628021a12.2
        for <workflows@vger.kernel.org>; Sat, 14 Dec 2024 08:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1734193902; x=1734798702; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YSMPYzUxCS1+M94lq1DhBfG9d5bon4YtVfF19FFr/ZQ=;
        b=Ra67mIeSVjc+kW4pyCZFsTNktDFmwh6uM74o8vTN9Q/eKlxsE0wZ1daXOPk0jpMsqB
         UkcAlATlRj4kETyOgw6KCc0Bl5PLnFwBWczyFZ4AAhIsAXwe/rymHXYlbh6+XyXcDC/y
         fTIze9b3CgKI+4szV4M7eQXf9MLIJIPhiaffs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734193902; x=1734798702;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YSMPYzUxCS1+M94lq1DhBfG9d5bon4YtVfF19FFr/ZQ=;
        b=fiP22BIL5JLNxoILwfgu2yfOKieHmVLvEf/ThCqwzZqZD5g55EdpVu654LowCBLgvA
         7JOa5PxAjZozwm4d3fPjb1Lj7ikEVTCoExk72ffuNwmj8iydOq5DZGDEdioJtBX9e6zp
         0Lgttbw4msBTNue8MhHtOdOIwdkwpc9F9hFgzpi7nzRhnYqRIxbGRIA2NDvLRBE/ljXP
         E/nW1Um9BjkGUyzu+kUc1vDzPvMxRtH+eNwoK7IwjsXnqv6K5FYAUEQypmEp5lHFU8UZ
         6ughdznJtMTevrNgHlXNquoWyUqQr0wWDIEMD2zf605bfBEv37euOScAj9Kp7WWrIsnV
         JINg==
X-Forwarded-Encrypted: i=1; AJvYcCVS+8gETS0ikCy2/VCrcbbxMDkZbXWcEQ6mUJJAeaBQIIXIIFZJqsu/G06jyw+1VumuY0izXijzEvU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzufUNloE33wzRHbCutodFxsrARCCYzivBnuCsRPsnuuX42/vmv
	k5Ohah5XvH3lEMX+QCoJEth7usI5suklQ3HfmbigT5Xz5n57i15R9lXjG0l1v612T6vNg/sn2j2
	7CME=
X-Gm-Gg: ASbGnctjYt0c2xCH4hZHf9TkGqopFukWuQDHVy+rjpkNzFFggNSUuRThsZQoRmPThpv
	Ofu8Ny0JWg8o7c93j0LUVadwTCEFqazjRFWuY34MquBgjTaFni5ZiBJE6KlMgOVXin0XU/Ky9Ye
	cdcR7I3URkVGGXvPfCh2aYyoq7ghrr0bAok5ZPM/n2sCLfb7AoXI9mGHhlD+yWfDcwvXMzOeelu
	WqMKOPCnrfQDXezUFHslXchiLh6oS3w2SOyH7UYC4h86eJrx4FbbYu2Yyd7zO2LxpUQ/rT1wkYL
	/y1iX18bk7zo4b2g8BuWVWqqB7zjvUA=
X-Google-Smtp-Source: AGHT+IHv6OOL66yEPyzQMjaacxapy08xZe42F9iTCZJfETbN7ZFPFP+8KqR09dSSI/Mg1SwdOVvveA==
X-Received: by 2002:a17:907:7216:b0:aab:76bd:5f8e with SMTP id a640c23a62f3a-aab77ed35d6mr615307066b.53.1734193901725;
        Sat, 14 Dec 2024 08:31:41 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab963598b7sm110685066b.101.2024.12.14.08.31.41
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2024 08:31:41 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d3cf094768so4203800a12.0
        for <workflows@vger.kernel.org>; Sat, 14 Dec 2024 08:31:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUz0xtEaLCqBMxPpja3+8Mei5fgINgTa/ecBWWMY1cu8w65S0sDRuX+D/GzoSA2Kph71jLUJvPq1vM=@vger.kernel.org
X-Received: by 2002:a17:907:2d26:b0:aa6:691f:20a9 with SMTP id
 a640c23a62f3a-aab778d9db3mr565846766b.4.1734193900694; Sat, 14 Dec 2024
 08:31:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1733421037.git.geert+renesas@glider.be> <46b320b91b8d86fade3c1b1c72ef94da85b45d0d.1733421037.git.geert+renesas@glider.be>
 <CAHk-=wiwAz3UgPOWK3RdGXDnTRHcwVbxpuxCQt_0SoAJC-oGXQ@mail.gmail.com> <Z12sScjRHpB1d0nO@casper.infradead.org>
In-Reply-To: <Z12sScjRHpB1d0nO@casper.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 14 Dec 2024 08:31:24 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgrc4zvZg+Sz_aLmMbaJ6ZHYaJBQ7nzByj2pMZBbh6www@mail.gmail.com>
Message-ID: <CAHk-=wgrc4zvZg+Sz_aLmMbaJ6ZHYaJBQ7nzByj2pMZBbh6www@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Increase minimum git commit ID abbreviation to 16 characters
To: Matthew Wilcox <willy@infradead.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>, 
	Jonathan Corbet <corbet@lwn.net>, Thorsten Leemhuis <linux@leemhuis.info>, Andy Whitcroft <apw@canonical.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@corigine.com>, 
	Simon Horman <horms@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Junio C Hamano <gitster@pobox.com>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 14 Dec 2024 at 08:03, Matthew Wilcox <willy@infradead.org> wrote:
>
> I have wondered about using a different encoding for the sha1.
> Classic Ascii85 encoding is no good; it uses characters like '"\<
> which interact poorly with every shell.  RFC1924 is somewhat better,
> but still uses characters that interact poorly with shell.

I suspect that the pain would much outweigh the gain. You'd need to
teach all tools about the new format, and you'd also need to add some
additional format specifying character just to make it unambiguous
*which* format you use, since if you just extend the character set
you'll have lots of hashes that could be either.

And you could disambiguate by testing both and seeing which one works
better, but at that point, you're much better off disambiguating the
current regular hex format by being a bit smarter about the objects.

Using base36 doesn't add enough bits to then make up for such a
disambiguation character in practice (ie 11 characters vs 12 - not
really noticeable).

base62 would be better, but christ does *that* really result in an
unreadable jumble. At that point I'd rather see 16-character hex than
the complete line noise that is base62.

Also, I bet people would start looking for shorthand formats that
spell rude words.  You are kind of limited with hex, and sometimes
that's an advantage.

                 Linus
