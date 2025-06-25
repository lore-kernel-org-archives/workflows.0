Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ECA279DCD
	for <workflows@vger.kernel.org>; Wed, 25 Jun 2025 08:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841582; cv=none; b=A8X+HEix6AaiCNvI5ffXS2WQfr5QcfJPixnIOIXNhQP1Zi/DPdeYyO8qaAimWV+tbfljoI3IsD/lzLlii+YW1cADXi9pnaImDpnB8XxxotpzZw6Z3HwSoroeZdAFdf2XvetiiFFnsVYVI/j+HKjVsH2G15YuJEpA9cR9vbAnV3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841582; c=relaxed/simple;
	bh=/aGMiSWgswdb3PxpszlBovn3np9bIPgjxtNCoeUpgjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JGxHkDjP7C/58Iveyqfl0rpIf2YLj+2gmCvGIflJd5C3yqQvGGzFNpwMbVjloilDNRn7J0I42Z1q3VJDP6yEqzwT19uTxtrj+wcmTssVx42uiB16Wv5JWqdg2rAmqkTdRivjsmi+K+WW2fzSfgf3l7K8K4pO7JKL4YheBt1kGLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yNvBUzm7; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yNvBUzm7"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32addf54a01so13588141fa.3
        for <workflows@vger.kernel.org>; Wed, 25 Jun 2025 01:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750841578; x=1751446378; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/aGMiSWgswdb3PxpszlBovn3np9bIPgjxtNCoeUpgjw=;
        b=yNvBUzm7HQioAxHvUAItpxKH1RAv/arKTA+stNrfkSkTJkbZIuAk095lskBmUla+B6
         2UQUpfSej9VRX9QLEeFidWzhkHGIRzcrcVff2ri79PHCtz2r3Mmm4Zo1pOfXvsX4PwAY
         4dKY8mqX8SF5/sTlmrkb2EuCbJPvTJmGijpOLmsMg3SZv/5xJ+8g7wsoRAzqOZsF+Qnk
         GZJQa2wVPm5gwARjgYIuBPNLGCtywSxkAIS2DX2HD0YIuiGtm3bRx62ER1oz8J4vMZbh
         o4CJM0I4O6kPtYTE0XjJ81ut61unA/Cu9KDEGE5MKZBOlDYa8Tr9EUk9nCu8iHOa42QZ
         Hepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750841578; x=1751446378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/aGMiSWgswdb3PxpszlBovn3np9bIPgjxtNCoeUpgjw=;
        b=UIZlGzMMl7Dq8MoCDjhM21ZC8wtyqQP8OnEi4fyIW6jZONKbz/Tu/8ufQRMtO+f6Ad
         GSeDbz0+zN3yHAs87SnoRoE0Lb3/6m7BzmAZsidWj5pswBMaA4Yy6geymkWFyNwC4mK5
         EgRU8/uDgcDYbsti+TeidDtHbLKngkDnVq6b1DGFWlGyI/VCOzqUk1PeON+3T6gZWjAH
         OE62mVDgk61uGjOIkjJ8uD6o4D3Hs/GRLA4GxZrB3SCOp1VpmnowOSxCH3d2XxOHYmhC
         3KMFszkIS9YiW46+1V5sT42WXG7KHJvCPTYi4SJE1ncyq0C8U9Sd0tXS7gGO+ag2mcQN
         L9TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIcEflUBtrFbrr/JuqQeTLId87K6GT5Hm8EnOejz3wWV9Z9dgudVEbrQMh/srqP53m7f7BgCF2k0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YznAJ+l0vzA7em1RjjCo0an3ivmYSjgGnRUoNXTwAbNgB2QOM+/
	AHjc2r8ZIhOmjcwdb0f4u4CqcTm8UbC6TYiPMOVE8uL+LXRsdiJaYlrj6ewYrEO/Rv2QHfVC5G4
	4WAM2RFr7qXTpsvzeFlxFJ5K+sbtJ9SqOWeDqobS5
X-Gm-Gg: ASbGncsudRRXh4Ey/TdCCDdNlEro3uV8G43o95ci0lNBFnYpCX6rZmhMgfNlCxGWKEN
	GKpJN99qVfGlmZMogBbvMidBElsQ9P2I2sTc3FFnzpjFh7JrncasYuXgTLU25+kH3dYd1tbztzr
	9cI2yuxpnUZZ+CycVtiqeiPJo2jWZ6i14blqhOXEYWfVj7BsswlocCyOsv2yTsGv5vRpPmhH8hG
	xcy
X-Google-Smtp-Source: AGHT+IHn5jN08ujo8GoOIZXJyGKEDPnWbpxEqhAfrT8jEIaoiQ0R+LhHX8niQOlMCvkzPsyqSYJbSovaD/ar3ODPJFY=
X-Received: by 2002:a2e:bb98:0:b0:32c:bc69:e918 with SMTP id
 38308e7fff4ca-32cc641db52mr4677001fa.1.1750841578106; Wed, 25 Jun 2025
 01:52:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aFNYQkbEctT6N0Hb@lappy> <20250623132803.26760-1-dvyukov@google.com>
 <aFsE0ogdbKupvt7o@lappy>
In-Reply-To: <aFsE0ogdbKupvt7o@lappy>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 25 Jun 2025 10:52:46 +0200
X-Gm-Features: Ac12FXzXBIFSLBsUnXVDMCaUxIQVjV8jup_taqhSUWe1Psb2MF0u58GMi7noczg
Message-ID: <CACT4Y+Y04JC359J3DnLzLzhMRPNLem11oj+u04GoEazhpmzWTw@mail.gmail.com>
Subject: Re: [RFC 00/19] Kernel API Specification Framework
To: Sasha Levin <sashal@kernel.org>
Cc: kees@kernel.org, elver@google.com, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tools@kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Jun 2025 at 22:04, Sasha Levin <sashal@kernel.org> wrote:

> >6. What's the goal of validation of the input arguments?
> >Kernel code must do this validation anyway, right.
> >Any non-trivial validation is hard, e.g. even for open the validation function
> >for file name would need to have access to flags and check file precense for
> >some flags combinations. That may add significant amount of non-trivial code
> >that duplicates main syscall logic, and that logic may also have bugs and
> >memory leaks.
>
> Mostly to catch divergence from the spec: think of a scenario where
> someone added a new param/flag/etc but forgot to update the spec - this
> will help catch it.

How exactly is this supposed to work?
Even if we run with a unit test suite, a test suite may include some
incorrect inputs to check for error conditions. The framework will
report violations on these incorrect inputs. These are not bugs in the
API specifications, nor in the test suite (read false positives).
