Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E062205E3B;
	Tue,  4 Feb 2025 07:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738655985; cv=none; b=kSof+w7Fe5npFmiPOzPZLt3QLMX5cuJ2vWuVhydbMxTxJqiDRQ2MygsH7KgPdMgiXRQ0fqmVSzRIG4W4YmUrlO5AFKDz5FlKxtwtxcpnzg7tCi1BRshhg8Kjrag0fdOVv/Fg5dfsXXWzJGJfnXL+0WI4jdwJZCUQofEWfntWyHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738655985; c=relaxed/simple;
	bh=LCrDNv0z0MBAANgVRulP500OUmz+jroCzD8JSrqy63w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ol/HNRAnIGf6cv2s65zEVGbM3q6mR/dDaYoZlP/D5XqkxIMdccenyKRfcjSF2IEyPYfHrJNduLGwNorn2jigermx3pIEANuSDXg5gNPe5VHCipCJs9AHD0FMPYhH8Rikb035i/liTz7pl5sf+0XjOnIHQo7TTrqyJlIOOP5odq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4afefc876c6so1519016137.2;
        Mon, 03 Feb 2025 23:59:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655981; x=1739260781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dDsdvKAM48wMU0DaDVaeE43n4VrWLg2mOANZPQ5dnv8=;
        b=WGdrW0k5qQJZ/c5f4n1dyTOgFm3z9PDh7ACMntzRrRrmiDgUHX39oIXQTtIdCHeRY2
         g2WEF2iUaY3NuOxmnyUYTY7rqtOc42g+AC50nnXH2UbYnwzZcgr/HL+4hXgMDumdyfGt
         3Lfz5+iKAUiKMhzkWcyb9EzL8PS/r2zYMPCv6StAWeG87ipOrdOMtneQ2IGKyeFBJv97
         loawiU6LBwM1VPb5ivWYxGpzpwUb71aBPigwIYu8Fw+S7QM3twpukyMI7N0GDQ25rwWB
         rGk8PaL4VxZqLgrLD2iLSMRs2VF0Mhee0eq7NiQZA/Qh/Qf6E2VTd/2uHnnZGU5xDBru
         hbtA==
X-Forwarded-Encrypted: i=1; AJvYcCWDgsLVfEtn/dle1nxQCRYFKRz6rNSAguSf9LvSlaRDlG73NKg0napgT9C/twFLdJ+d+vZmIGn7Cg70@vger.kernel.org, AJvYcCXMTrZYhccL9uBYAb7p5CshgMp06Sg2Qwjy1s9adBwztAVXXMrgYemWaq1xM8pvLJ+QPyb4jtTX7bc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsyqz0wt4b8POpmAWaiFOi1k/z89esu6+z23k+iUt2KI8V20ZG
	pfxg2an3OPtKXFiou8pEVX/nns+Ilxsg90sw7NTL/qpg9Npl3L9NmHgd6SFJ
X-Gm-Gg: ASbGnctRSma4d43iLK/QbNz286+U8iEoS+Es77126RCIDnJt+Lp4e+UVxRUGgx21F52
	cBNqS2MDpYynsxb2pU+3dbP5peNkrD77JczIPbSLymSBaZ7mqJ4r6/h/sqldBGbTCJigZnk5v2R
	aJCpGOAW/c1MF7InRcz102H+IdankZG07rggQgYuc1rG7ANt0GeLLozCVOxcNzy5zhg2/dn7FVz
	143hN1jEytOizPArRbKFySD57LrAb1jCvspv8qsUMNskw9dUc4ZOjnezRGhOdCxjJMYNPCNs1dg
	fCh1mL7WQBp10l/DZV+LP8O4fyA2h5aM1NmCZxae0uBQCgutIhPwag==
X-Google-Smtp-Source: AGHT+IHjIT6vtnqf9oXtbBh5MFs7ChcbPFQcVBy9mTSXOKfsEhK/zaGjnivH1GavljnVTTtZX1CeHw==
X-Received: by 2002:a05:6102:d88:b0:4af:dcbe:4767 with SMTP id ada2fe7eead31-4b9a4f14e0amr18424020137.10.1738655980987;
        Mon, 03 Feb 2025 23:59:40 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baccb66bsm1862368137.20.2025.02.03.23.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 23:59:40 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4affd0fb6adso1708138137.1;
        Mon, 03 Feb 2025 23:59:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVz7nlhTtkitIjCsffYZCoetHzf7IxzcmSKnmIdd0F5Eub8Lw1LT6mUI52ef6vlt4YdMQ4181ZCVCI=@vger.kernel.org, AJvYcCWvUgbQB/N1kAMYUMeMrtiyPzvRMM8IpuxHSxKAnAls9CM4q/divQunE7InjSf9nqD47PZlcCW9B6qy@vger.kernel.org
X-Received: by 2002:a05:6102:3e15:b0:4b2:5c2a:cc9d with SMTP id
 ada2fe7eead31-4b9a5230b82mr19139572137.16.1738655980520; Mon, 03 Feb 2025
 23:59:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203174626.1131225-1-kuba@kernel.org>
In-Reply-To: <20250203174626.1131225-1-kuba@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Feb 2025 08:59:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXXNkpWjkKvMLd-MF=npzqJXMtnXkaba60JY7hCzyjz7g@mail.gmail.com>
X-Gm-Features: AWEUYZktvGKQzKXDfyoMEtemz2PtqJdRX60VTsjDpLFC8EJTKDZMqnYWQSoIzIY
Message-ID: <CAMuHMdXXNkpWjkKvMLd-MF=npzqJXMtnXkaba60JY7hCzyjz7g@mail.gmail.com>
Subject: Re: [PATCH] docs: submitting-patches: document the format for affiliation
To: Jakub Kicinski <kuba@kernel.org>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jakub,

On Mon, 3 Feb 2025 at 18:46, Jakub Kicinski <kuba@kernel.org> wrote:
> Adding company name in round brackets to From/SoB lines
> is fairly common, but I don't see it documented anywhere.
> Every now and then people try to add the sponsorship lines
> to the commit message, fun example from this merge window:
>
>   Sponsored by:   The FreeBSD Foundation
>
> from commit 2ce67f8bf1ce ("wifi: iwlwifi: mvm: fix iwl_ssid_exist()
> check"). Better format would be:
>
>   Author: Miri Korenblit (FreeBSD Foundation) <...
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Thanks for your patch!

> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -717,6 +717,12 @@ patch in the permanent changelog.  If the ``from`` line is missing,
>  then the ``From:`` line from the email header will be used to determine
>  the patch author in the changelog.
>
> +The author may indicate their affiliation or the sponsor of the work
> +by adding the name of an organization to the ``from`` and ``SoB`` lines,
> +e.g.:
> +
> +       From: Patch Author (Company) <author@example.com>
> +

You probably also want to document the other popular[*] solution:

    From: Patch Author <author+company@example.com>

[*] Statistics for v6.0..v6.14-rc1:
      - "(Company): 3430
      - "+company": 2871

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
