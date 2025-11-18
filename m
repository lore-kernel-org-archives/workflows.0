Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE7822B5AC
	for <workflows@vger.kernel.org>; Tue, 18 Nov 2025 08:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763453302; cv=none; b=rP6l5rxYjQ56kQuqfMIdFTzBQZEUAOareNKDQ7nPMQI0L2+pZ1bPA07/0dufOH2ueppYfuO40ooheoejXifpIVKKWUH43UetzBCnvfd3MOu1Y7YB2SYOJS/xP1JHIf+AgE2LQe1ddBJ3O4HHvcqK5REBP9nphxXIElj5D//u5Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763453302; c=relaxed/simple;
	bh=XGiihLBXKPD9ukbo6kQMQ3MBqrEpjs6uCB8MSE1Lgwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uNqOhwPjZw2rydhWjvIvOkr/tSkgz+a3ni1ErD/lClNITNF8+zmAvHbnEVh3JaP0be3net6V12Dnq55QAXBS3iWjgOQTtnXsI83SCWsC0t3QYW/jf3604Glt1i3S0TEfy6k6eZSKIHwS+JstmSfjuC8BDcrrGSU6ZRdL2CHZHsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-55b104727c8so1299318e0c.0
        for <workflows@vger.kernel.org>; Tue, 18 Nov 2025 00:08:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763453299; x=1764058099;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZM9VzAmTBs3fZeiLb0JvTeogSBBQRAI6GehzZBDgay4=;
        b=v1UHuF+gJTi1CpB9Thv/HqPabg3KI1wGWrco6125An+eq/f8k+B2gm0eL1dOdofvLc
         p/dTi9Gk4zRoipSoySh02pLwMoVxC+U8AL+wpzXQXLnSBPKkT+eXKCgy6ZYulX0iViVt
         jVTbiZDmTM+Zi286paJf3axSHu4uYTPfBUNfO4oLpmaySbJRTY6F5Mte7ZzNHtwjkf/H
         aWuhBEe5A4AnSqYsrxU7QrJGPtlCgVLVUsMp56mN/d/U6i3G0Jj+0+hdnBxyE7T5ItAH
         L9BB+Nj2lVNmSB0Wz9yjW//7H7w36HdaINwUTOUYYnYI43LcdLxWcgdBNgbIyZl4jhAz
         3iow==
X-Forwarded-Encrypted: i=1; AJvYcCXfPGG879x9K/WiKKOj+cKkUkg5QqGYAGOd/kNi4jn/vLaKe32JFp+uwKzfihEn7Mhi4kuc8hfIVdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmnzPx0Qp7pQdiPPRRWIoFmd31RkQzdaEdNqX9sA/0WgfOXig9
	uUSZL/Ez9xCrIUhsmD0gAIsq9ddrq2WCWAPN+MjB/OXXkgQvR28JoPM7ey8J4sgbxzM=
X-Gm-Gg: ASbGncsvuOrWb+FhUE1an5yEt9ommn2rwZpFf67nnkpAd2Qrc/kgaCELJSdWk8n2Wep
	ZJFGxU8x34VCedEnV0FWagb+VZm7VAhfxf3VMhm0eKByfqNA3RHPIop8lnBfpodny4DJiSkS9PZ
	k1HGn5ZGHnriRpVEzekCKCTi4ewGeZ3csZ6qeeYkmaMsoJnjOmQE40ebqD0SEhEaBTMycr8kCrJ
	RFjW1mjvV00WqNAt1nib4SvWuWzPjgMAf2O0N/nHOL1uPu5rGlM8LhUJzUOYHRL0CGeKflUE8fA
	wTeprKAtZmJPOErBbQOQxWH8/WZUlk2/KmkpQdRXP1ek4ra4UM7gixVqf71H6T4rFVDarbi6zlG
	XfOfkoQ6yceOaYvSTvqehcBpnoiYrwspdkhRQSl/FwA+iAV08rlOAG9ttK//KhD1E77iOwsf3xW
	YkCE1O8p9ujg5ZeJv5R/gGRP5OzpNBXJ9QagDHDCrvWuCG1WRnv3K3wh44DbPCfwjELPIcYJIwD
	g==
X-Google-Smtp-Source: AGHT+IEqcHmnV/pvSBthRnbqD/GVYMclvyXvEsW9KwtaksBrW9FNjS6ZzoyrLbVy2YiS1qZTBgHYjw==
X-Received: by 2002:a05:6122:1784:b0:559:b2cb:5d9d with SMTP id 71dfb90a1353d-55b1bce5707mr4725427e0c.1.1763453299212;
        Tue, 18 Nov 2025 00:08:19 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f4986fdsm5335396e0c.21.2025.11.18.00.08.18
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 00:08:18 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-55b104727c8so1299312e0c.0
        for <workflows@vger.kernel.org>; Tue, 18 Nov 2025 00:08:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUiYG/7ueYlrYIX1FYQFd26vIyCNK9OyLXRxKFJdupvJm+DbOjd6AfCzK38atWq5RcEXnQwWDHNBDA=@vger.kernel.org
X-Received: by 2002:a05:6122:4685:b0:54a:a048:45a4 with SMTP id
 71dfb90a1353d-55b1beda7edmr4592976e0c.16.1763453298630; Tue, 18 Nov 2025
 00:08:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117213801.4077535-1-sashal@kernel.org> <aRvHpfke8hZ--AHF@archie.me>
 <aRvY0QbRzkh94zql@laps>
In-Reply-To: <aRvY0QbRzkh94zql@laps>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Nov 2025 09:08:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXaxo=i+QPEDFwJEMtcuVs-YSa6ZUZTA9sg=Ytw1KeN0w@mail.gmail.com>
X-Gm-Features: AWmQ_blTvdvRHcaJwUYBVX6wV9Kh7ZXYBqeN2r3oaeJBk2fWBhQbVStFTLOfslo
Message-ID: <CAMuHMdXaxo=i+QPEDFwJEMtcuVs-YSa6ZUZTA9sg=Ytw1KeN0w@mail.gmail.com>
Subject: Re: [PATCH v3] README: restructure with role-based documentation and guidelines
To: Sasha Levin <sashal@kernel.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, linux-doc@vger.kernel.org, corbet@lwn.net, 
	josh@joshtriplett.org, kees@kernel.org, konstantin@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rostedt@goodmis.org, workflows@vger.kernel.org, 
	joe@perches.com, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Sasha,

On Tue, 18 Nov 2025 at 03:24, Sasha Levin <sashal@kernel.org> wrote:
> On Tue, Nov 18, 2025 at 08:11:01AM +0700, Bagas Sanjaya wrote:
> >On Mon, Nov 17, 2025 at 04:38:01PM -0500, Sasha Levin wrote:
> >> +* Build the kernel: make defconfig && make -j$(nproc)
> >
> >See Documentation/admin-guide/quickly-build-trimmed-linux.rst.
>
> ooh nice, I wasn't aware of this one.
>
> >> +* Attribution: Agents MUST add Assisted-by tag:
> >> +  Format: Assisted-by: $AGENT_NAME:$MODEL_VERSION [$TOOL1] [$TOOL2] ...
> >> +
> >> +Examples of Proper Attribution:
> >> +
> >> +Good examples:
> >> +  Assisted-by: AI-Tool:model-version-1.0 coccinelle
> >> +  Assisted-by: AI-Assistant:v2.5.0
> >> +  Assisted-by: Code-Helper:model-2024-04-09 sparse smatch
> >> +  Assisted-by: ML-Agent:version-2024-11
> >
> >So mentioning LLM version is strictly required?
>
> Ideally yes, it'll help us keep track of which tooling is being used, and help
> us improve our workflows based on the results we're seeing from different LLMs.

Apparently we already have two users, without version numbers ;-)

  - https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=913e65a2fe1a16fa253c4a016e2306b2cf9ffef8
    Assisted-by: Google Gemini
  - https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=525cebedb32a87fa48584bc44e14170beb2c10d1
    Assisted-by: Daniel Borkmann <dborkmann@redhat.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
