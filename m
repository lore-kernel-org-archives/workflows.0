Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD5734CFDA
	for <workflows@vger.kernel.org>; Mon, 16 Mar 2026 07:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773644769; cv=pass; b=os3JxgdGHiCJnyaXJD8gnaZ4VIvlNznM33eDB8AAfo8LJXndYpnbfgjkc5ljzcl0D8Ebmi4KRbWSov63roZC2yHe8FyQigq9t6L37JB/ZIZxxAdd6yK3yRdWb8q4xMKY23gHOCAhEIsdmj23Am49ee5EmpjCa9OjTZM0mMyU59Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773644769; c=relaxed/simple;
	bh=DWa/MwbMbU4Cgy8HcLpzA6KnltFCFdwdVTLoxcjvQIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MGxDwCfQnDggsFARzItD5A7X6ZUezKxEf/JE38rINShInrXpI/Y5Nz8AnbVmereSE4iofY94MmZGt1O6ooEFre3mG/NPiqNrrnhDDM7oCq5uGKLfBaY7Uw4HvUyJ3UjyNS7t2t92gZBhPxqt97YuIE3iUYYyjZhr3b1st5KvYqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rrvNm/sp; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rrvNm/sp"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38a32d36396so36575161fa.0
        for <workflows@vger.kernel.org>; Mon, 16 Mar 2026 00:06:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773644766; cv=none;
        d=google.com; s=arc-20240605;
        b=adlapmadNDn+Vlt0KknEt92zvq5oLdtZXWN217ln7hplnIxCYgsN+Nta135TUAaS0P
         Jn9CBSPnncFOTTt+ieQJvL8UUMNU0/ZcXse2VHWvjypcf1Pc2ATVgJ0yGpYvO4J3azrM
         e06lVIVFPnIfI3aSHmpBkffjkOf7zqrFE1VeojeHVh6LzPykqA95IJtNVcRGj8edGFu7
         n29S60dp+qGDem+ThWjxvhN8gW9XQbX9UD40RdCYDjBaryjKaC7b/KcUswMK3DHNa5c0
         /vNM1iQprSEGulc5hanACr2rzbEW0sbJaXJiXGaopGVAavWRsPHsXz5pz+sRWft/mXO3
         UU4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DWa/MwbMbU4Cgy8HcLpzA6KnltFCFdwdVTLoxcjvQIo=;
        fh=0GUr3PzLL1U2T38HBl5DgyguyBSf4WxhSEXdlHT46sY=;
        b=hG9ipIPc8wuSLABennWAa7WmUCqy3owD+MlOzrF6AkLsa9Q2ejL7GEoq0OM9PDcGFS
         vvriZ4w67mLmgXHMnEsojRsWFq6K5Rik1mk9TN22uJ91Sam1xW9SDloRLm+5APssX3+S
         kTkzLcve5AD9icQ6z76TpppcGF8yC13iYZAoqlj5DjhpGz4irCd8tGP1nX4bmLASQi9p
         BAFue7/dom6XhqYKEmhb1VBoYqhOk0GtbmqJe+kaqRJHWKawZr7sXafwxY1oC90YH7AR
         F2Og68wfU+kimgwwkjh8GFDT9hzLKlMuJewb/Ad1f38uokTF8wEW7foPqJ57tEAT0/nC
         TNtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773644766; x=1774249566; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DWa/MwbMbU4Cgy8HcLpzA6KnltFCFdwdVTLoxcjvQIo=;
        b=rrvNm/sp0ejqtQpts4YJvKIZJai0U7h6SimZ1+626FCi7l4L6Dzs/D5AfC15pRBoWr
         kv/dIm7CfHnm9HMv/wH+hAenKg7VAAA/E7tVULHXPbxFq6YGS4qlbY3FPnHscS4jfzMo
         D3dH3ecOve/eQGzSnAb4Ojy44wq5Nw/0FFYtscPxcItm710bCdD1kjJ/hOB3448XZy8f
         K4xi4VdbUD1F+Vo4MhfBcbKbgnUdds5xx8LCHziC6xxbqHA6MvyjhOKbbiisyPVocwZ3
         KxoLuACxgOlrc3AY0BNPbelvSOBLVO9w1iQzbOC3uVjI5svhEljwS33qC/sFSOyzUjaG
         pJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773644766; x=1774249566;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWa/MwbMbU4Cgy8HcLpzA6KnltFCFdwdVTLoxcjvQIo=;
        b=ElE2CypYfjCWOZYP0HI6S4pgIY5PK/rEoFgUMqj7S81vwBy7bvqR7ArK3PA6pbxDOI
         8DScr4g+mjg2XSx8Gd9kGKxan5oOIu92HbzAtysFyFAu7R8FIs5jpKyBFX9lo+awM2Gd
         QJtr6KqOdPf5EcuoxNYxn8lEUJFx9uIsvgc63Jig5Q0AFTNh7ExLaetEmkj86y6yyvqV
         GSwPL4ZJEZi0ktfIO1LVRPH1jgqd4VzvpNitgBKeAT28My+3V16f4JGhWkLyxxNJQJd5
         cWIkyVUHJXUvuBDJ/ayDUhNNPop0dMDqXZJyySkMN27lcVdBwzXBgISectmhfQabZhJW
         B0kQ==
X-Forwarded-Encrypted: i=1; AJvYcCU95GRKF0ngagpp5iBXNUJQQeFUxAaZ+lFzeotrRs3D0uFCxlqBMxNoJF3dY2zHDbwY8cBKkzl75iQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yylhoczb2uD2rxZJK+1ZjKUUDp9p3+7rHuyoCzVhpvc36/w9zQr
	sOXNmh70rSUPB2FqwenImw5uXIpY3UbLC7AP2JnZMv087A4YatvR977dP77yBR0S43FmWBkfGvk
	rlb0aj7jNlmIrqc2JWciYPAGotMYi1UTpYv3CsO5R
X-Gm-Gg: ATEYQzxqO6q66eCTXXbwRezkTEqJ8yC04mGbNeftt7xzdoEN2E2mkk9VLE8eeaXu0Ds
	inlfBpO6gWKsMJS5DJ9eT+3vQ4p9Z22Qtq52yPtIU8e7UcEPnQcAwcTAy0RMnYVTVkoKp+QRnNZ
	KOw6+vkl5Ge+VVJ4epHDUjX6IQxO1MjiKw+TyFCM6DgncTt+90JAdznb2AqqJ8evw74NuiDnV91
	WOSfteXLNpqOM6t3mQgi5GYfB4zfUEae8tgljFTDPUbbwlnmkngOniKIwc7n8VPlOEbR8QjxwqZ
	HWqcQIDnD3oYRFfoDVYMeVRzefavxJlbuY2WM2PreZSY1Zo9pF0ler7L1t98omnMqgadRA==
X-Received: by 2002:a05:651c:4356:10b0:38a:2db9:eb72 with SMTP id
 38308e7fff4ca-38a8864c94amr30667511fa.16.1773644766146; Mon, 16 Mar 2026
 00:06:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313150928.2637368-1-sashal@kernel.org> <20260314111822.63a2ba4a@kernel.org>
In-Reply-To: <20260314111822.63a2ba4a@kernel.org>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 16 Mar 2026 08:05:53 +0100
X-Gm-Features: AaiRm53tuutFjpddzDm8MgJQk_X6I9zzb6Uz-8-_BFX3BICSXZm9HxgKcE0xoPQ
Message-ID: <CACT4Y+arWePyxnV3hWk5RanWZpoc7=ALQ6DV_2MCuQkNoTtJUw@mail.gmail.com>
Subject: Re: [PATCH 0/9] Kernel API Specification Framework
To: Jakub Kicinski <kuba@kernel.org>, syzkaller <syzkaller@googlegroups.com>
Cc: Sasha Levin <sashal@kernel.org>, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, tools@kernel.org, 
	x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Cyril Hrubis <chrubis@suse.cz>, Kees Cook <kees@kernel.org>, 
	Jake Edge <jake@lwn.net>, David Laight <david.laight.linux@gmail.com>, 
	Askar Safin <safinaskar@zohomail.com>, Gabriele Paoloni <gpaoloni@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Sat, 14 Mar 2026 at 19:18, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Fri, 13 Mar 2026 11:09:10 -0400 Sasha Levin wrote:
> > This enables static analysis tools to verify userspace API usage at compile
> > time, test generation based on formal specifications, consistent error handling
> > validation, automated documentation generation, and formal verification of
> > kernel interfaces.
>
> Could you give some examples? We have machine readable descriptions for
> Netlink interfaces, we approached syzbot folks and they did not really
> seem to care for those.

I think our reasoning wrt syzkaller was that not all interfaces in all
relevant kernels are described with netlink yml descriptions, so we
need to continue using the extraction of interfaces from the source
code. And if we have that code, then using yml as an additional data
source only adds code/complexity. Additionally, we may extract some
extra constraints/info from code that are not present in yml.

Realistically system call descriptions may have the same problem for
us at this point, since we extract lots of info from the source code
already:
https://raw.githubusercontent.com/google/syzkaller/refs/heads/master/sys/linux/auto.txt
(and LLMs obviously can allow us to extract more)
