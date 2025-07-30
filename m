Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602D31FC7D2
	for <workflows@vger.kernel.org>; Wed, 30 Jul 2025 22:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753913190; cv=none; b=tjaMmhCzdneuCe7WcVmUzPkEcrxVuUxgZ8BFE7nsjiXtUyBX62OyZd+0nm/K1KarCo4N7sOXDphtOELv9MYzNxBSnk7EQcWedTueio5B1Ddmit8JMnZCtEWmbtRkChP1OTxRFcydQJRmRc5a56h9a1EQzOT5iUwZYuT/Ss0iGeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753913190; c=relaxed/simple;
	bh=5FDyXQRbCQzjtmA0ZBTa4CrTmcIqeuFjE7UZ+wGrZ08=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=da/tn57foBk3LQEGD3N1oTIRUFt2ubaObmYeX2rGAk1N8DZZx+DHe79uIXOHY++z4ykryBPF0IJsxaFWKq5dFcc6zydsYJvr0a6R9BR1IX65A7L/4yo+FnoiQAPi3C2wNUOedGPigVjsmM8Xdx1mOumTpLLcZLR3IvSXKpen3rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-73c17c770a7so346510b3a.2
        for <workflows@vger.kernel.org>; Wed, 30 Jul 2025 15:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753913188; x=1754517988;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CEntMuJf8K1VWn94KVCjax79vkBqXY4AtaSYgFOY52A=;
        b=aD0Qhv0UIbkufCdPM0+G+z58cmpg4GaNB0AELgiOWRj3utZnX71ShdpWK4pef05824
         uSiHgoR94QJXqIRR4Ufu0hyPOc5djDqGJ8GVGzv9xCuimqnJiU3rXrKH50qvlAwVGas3
         YjaLYNGEZybhcvz4M6gPE1bla/1HB+kU5qKzchuBkhuv8n3FxzVvjn/J+J38GC0KJ+5e
         3+a6n3zlRkO8K3+32Pz819XprAlbTdXhs1cm9h5Q/m+LNJs2yvyfLWfu2dd3hr9NDwhA
         DHosHAQmWDT9ZTOTCvJ0GiJu00k7jVC46W66S/I2SucBcyq0P7wI3Tmi4PNV7G9LYEsH
         pCAg==
X-Forwarded-Encrypted: i=1; AJvYcCVom/sVnfNCZux4jVOR3XpsLryWMZlX38EJdxFc8bFGkqCfMr0ou4OG2nKR0aLkiofyfbtIfjXC4+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLQtA/l/neWFJHh9jv03uj5jwyBYPImrZmap7fOUzbq16BtZzS
	IC7DF9l7y+yqf+WuaaVh1FmHr0txBS0YfsI94rAoEzkNi99BSbwC3/ZzsOATc7z6hgk=
X-Gm-Gg: ASbGncsk71Mfr+lnjnfjvGYIBrYKdVZaTHlypwt8SujIf/YWliRCauWoY/QH3O8WqwN
	CTAvhtTWUfHUM7k8enCqc9vBczpfhvJ1TmLV/62tY6eifQ9/wYHLY6/Z4bRc3Pf6m+gxDp+gpT4
	uHJ+c6qxQ14HOXUOLy9p9poDRlAdn/PEyXsbmR96V4aEQ6cBDQ5v8cwYQRJr1AKq3MdJrw2WU6s
	dbMbQi0adYZ2j5M+RMvf2gS5lGlMuyPOOlV6GZAYbJovrd69WiPpUmXklnoDlH6iqsjn5AuvHZk
	pmmBov5sgUq26uNH32DE8B8tDfNCtEoRKLh3ukUTO6jLEXV13YrdMzjSX7RtAwXLbreO7gncpGH
	aL9arjBhDVsMTLTj7MNIB
X-Google-Smtp-Source: AGHT+IGKMwSJ63Nd2yH1XeUzJy9fbrTtsLW845jouCtlujT+wryYRIBOXBjfDANPssG0sgMTm8sLcA==
X-Received: by 2002:a05:6a00:4b4e:b0:740:5927:bb8b with SMTP id d2e1a72fcca58-76aade688a3mr7553796b3a.0.1753913187759;
        Wed, 30 Jul 2025 15:06:27 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7640872a180sm11482407b3a.29.2025.07.30.15.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 15:06:27 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
 linux-doc@vger.kernel.org, workflows@vger.kernel.org
Cc: sashal@kernel.org, josh@joshtriplett.org, kees@kernel.org,
 konstantin@linuxfoundation.org, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org
Subject: Re: [PATCH 1/4] agents: add unified agent coding assistant
 configuration
In-Reply-To: <20250727195802.2222764-2-sashal@kernel.org>
References: <20250727195802.2222764-1-sashal@kernel.org>
 <20250727195802.2222764-2-sashal@kernel.org>
Date: Wed, 30 Jul 2025 15:06:26 -0700
Message-ID: <7h1ppxcp0d.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sasha Levin <sashal@kernel.org> writes:

> Create a single source of truth for agent instructions in
> Documentation/AI/main.md with symlinks for all major coding
> agents:
> - CLAUDE.md (Claude Code)
> - .github/copilot-instructions.md (GitHub Copilot)
> - .cursorrules (Cursor)
> - .codeium/instructions.md (Codeium)
> - .continue/context.md (Continue)
> - .windsurfrules (Windsurf)
> - .aider.conf.yml (Aider)

This doesn't work for aider, probably because the .md it links to is not
YAML.  When I start aider with this, I get:

  aider: error: Couldn't parse config file: while scanning a simple key
    in "/work/kernel/linux/.aider.conf.yml", line 3, column 1
  could not find expected ':'
    in "/work/kernel/linux/.aider.conf.yml", line 4, column 1

Not related to this series, but related to aider... I'm curious if
anyone has got aider to work with the kernel repo.  It seems to have
problems with large repos.  When starting in the kernel, I get:

  Unable to list files in git repo: cannot close exported pointers exist
  Is your git repo corrupted?
  Unable to read git repository, it may be corrupt?
  cannot close exported pointers exist

but neither claude nor gemini-cli have any problems with the same repo.

The aider FAQ[1] mentions using .aiderignore to ignore parts of the
repo, but even with an "ignore everything" rule, I get the same error,
so something seems wrong with aider and large repos.

Kevin

[1] https://aider.chat/docs/faq.html#can-i-use-aider-in-a-large-mono-repo
