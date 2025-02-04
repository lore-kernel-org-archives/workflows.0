Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2117E21ADAC;
	Tue,  4 Feb 2025 19:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738698219; cv=none; b=s1E1W3bOlMzeK5u5Aj7xB8uigy4OkIBk6VS1lLxDtAvbAUiMEp507stBS5DJt/5gL6TDqDVm78vvkawk5os3EuhF2aRWj/jAIXdYlcR+Er/243VGH99KbSlIrbBJegCxMjWrCDQrvnmPzsATxKaNNcSer3IXu7GoTI+BCqtF3uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738698219; c=relaxed/simple;
	bh=bGFChzkDmCDa4bT4tt+q2wUy4aSZfv5t9SMDduPBkRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C2OoShW0/fsEpmFzkti+LmJJYAc8jugrSZVFCb1Xjmi84wXFZUm+/AxIv4PySZKnKXpxAw7f3Cq93QOP9kJGEKvZmh4+wkSivJimU5gELTNVjOH3bucWCUKSU5h5WzkMXanaHjNVYNzP1zdMAK0skEhHCzpL46icNQ7qm+hwZn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-518799f2828so76491e0c.0;
        Tue, 04 Feb 2025 11:43:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738698216; x=1739303016;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=32QGE66GCW9sVs5NRaqxxE4/AHuoaXcZJviB6fKIFYI=;
        b=OGRnuuZ4KYh/xX3Ogjw/dtOYHZ7CgRbriH6GlDcZgdhmqtf4nf1NWHKQuEP2ZvXl+m
         tRwBSwN+aPSIzz+9EwLuB0501zk6rdPIxUm15SVh3uXjFYBvgYh4XhupFCn5wGm4vjFi
         +zN8QCz/eeE/CpmgYam4COPOXGbtWfxCOuauRPDPbLwiWIc7JjXM8jlg3N1EcO5lbMES
         i6ulA2pJKc/Pb0X344NCHlc2Lbf+EutBd7RZ22bAsIuKxbbfWqVaMQgpkV9eX1PVNWoy
         1Cd3gxqkpBVsq3BFfKkMMgPH+vl2xRBbe7Jph7A+3o5yQJ+O+2pv+yYgLDaR4oiEo1g5
         aqdw==
X-Forwarded-Encrypted: i=1; AJvYcCXVt6JonknjGA918PE9tdPVYklVRSn1C3hPamqSi4xIoVV94OLAX63RsKtY1kkDFnAxk5ecK/PmqPI=@vger.kernel.org, AJvYcCXoghv5rx37/RptBwba71opKzbk+7Gezknzs4QyHlk+v0I+mYwQ0GUiQF0EOQWKy7QhxgmNFgVzSCNN@vger.kernel.org
X-Gm-Message-State: AOJu0YxpFTA/FuYEMvo652unWpbm0RpH6uYmC4Tv0nfZZJU+JPPu/YgI
	LfqOvzg7buU8pqxfxfShXiF2ZtAa8CK/5FO2+1i4sTDy8sCLBtdTdR6rG8vN
X-Gm-Gg: ASbGncvoQjqRlp/O4LcjRjwGeVrwMMxwfIJWkjsDxamjxhhB2xE/J0N+oeRYLOq3VT5
	h3sRhnRDfpN1ziCIdoe8umq/QZppg0EijTXvQ6+QUFo6NOLaNUiCakuE0FKq0slqZpYStuUALnP
	CP9bX5uYNOzBLoWseA6GmqznvwOCG7cWwyMrKnkJ9yZkkxC4Jg7riH6EHnA/FAkuhhVTiE8Y9eb
	A7M6kQJv9bBQAs4eIe9at4t6vucByRgp8AnzZCzaG1KLruxoNsi1e8JYr8tZusE3PBakPhUz4+N
	d3yH1KKzO6X9qNK/nWQvqhAZj06fbqC2oQdwaVb1yN1j8NboX6skx5G4ZA==
X-Google-Smtp-Source: AGHT+IEzkhJNCsZXxiRTl6vnAsKHJHhvGXi0Aec1Hl0IbcFmv/OfqbbjfYUYOhj2MZA5bzULFLrQfA==
X-Received: by 2002:ac5:ce17:0:b0:515:d230:f2c6 with SMTP id 71dfb90a1353d-51ef9dfe04bmr3205389e0c.7.1738698216260;
        Tue, 04 Feb 2025 11:43:36 -0800 (PST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86694051da6sm2065145241.2.2025.02.04.11.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 11:43:35 -0800 (PST)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5174db4e34eso82988e0c.0;
        Tue, 04 Feb 2025 11:43:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUQRN0n2EhSFwdwwsopDgNn9lBCdbzIAYdLx/+cUjuFYbv3eYA0RNAgUljmLitw3NdpBeOBdv14pV4=@vger.kernel.org, AJvYcCW8wDPX6KhaTSq0HARKBpMvJrB9z7D78KzEXRM4u6mN8XW1gH5DsYgGWxDgC5WDAH1Io7d3Y72ik4el@vger.kernel.org
X-Received: by 2002:a05:6122:8c6:b0:515:20e6:7861 with SMTP id
 71dfb90a1353d-51ef966291bmr4339315e0c.2.1738698215588; Tue, 04 Feb 2025
 11:43:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203174626.1131225-1-kuba@kernel.org> <CAMuHMdXXNkpWjkKvMLd-MF=npzqJXMtnXkaba60JY7hCzyjz7g@mail.gmail.com>
 <20250204071834.78e0ffb1@kernel.org> <20250204154938.GF22963@pendragon.ideasonboard.com>
 <20250204081301.6fdb1536@kernel.org> <4f27a0db-256c-4792-a957-1387de9dc56e@infradead.org>
 <20250204113342.3b8f18f8@kernel.org>
In-Reply-To: <20250204113342.3b8f18f8@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Feb 2025 20:43:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXhfY7DMbY23eV8KrsN0PMjmU-aEQg1yWusO=VrVc+HvQ@mail.gmail.com>
X-Gm-Features: AWEUYZmtAOFNZUqPOTlDAyK-qsDVDBlykgJF0ULWd28E7Bz0N_QrIYAk0HGOfy4
Message-ID: <CAMuHMdXhfY7DMbY23eV8KrsN0PMjmU-aEQg1yWusO=VrVc+HvQ@mail.gmail.com>
Subject: Re: [PATCH] docs: submitting-patches: document the format for affiliation
To: Jakub Kicinski <kuba@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, corbet@lwn.net, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jakub,

On Tue, 4 Feb 2025 at 20:33, Jakub Kicinski <kuba@kernel.org> wrote:
> On Tue, 4 Feb 2025 10:05:12 -0800 Randy Dunlap wrote:
> > Signed-off-by: John Doe <jdoe@example.com> # Company
>
> Interesting :)
>
> On a quick look this seems to be the format of choice for maintainers
> who edit patches:
>
> Signed-off-by: Mr Maintainer <jdoe@example.com> # fixed xyz
>
> I don't see a single # use in the From lines. I think the # formatting

Because email does not support doing that?

> is well suited for free form comments. Less so for things which may need

On, Acked/Reviewed-by-tags, it's indeed used mostly for comments.
For editing patches, there exists another notation:

    [jane: fixed xyz]
    Signed-off-by: Jane Maintainer <jdoe@example.com>

> to be machine readable (for development statistics).

Agreed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
