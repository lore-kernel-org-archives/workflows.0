Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B9914B077
	for <workflows@vger.kernel.org>; Wed, 15 Jan 2025 15:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736955605; cv=none; b=lK1tJBUSdScuTKtCdmyBvBJ37AqnR7OAHeZvMy9p3I9+Mmcs+3c88aSxkFMtcPFikcnDjk8hmhal8WfwGiOzl4tyz/50jTz2Alz7M4e29T19O6EvV3L1xsdMgoBd3a7I/YsIoHDz8VXKon/TjuOJJeFOqN2WsMWCsB6nT+tFpCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736955605; c=relaxed/simple;
	bh=VK5C9Z4SSv5qoa6iG3PZcKtjJUSQhRy1hMBOhIy9H6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TCQK0xUGsuYZh+Lb84aqaoDq+62GuJgw5YsLWXaCiNOs3lO5Q89vj0gh0Iok89eVw5gGhLwlcyGE5jzFR+pPJRn8GMcevQpJA4W7YCfmkG0FSFY9erSyVOSD7/Vq0Qtsa6d8lDNL/oHQfSFmnmDZf21Vu4kbLvotq1obfCe/wew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ngNzB1XN; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ngNzB1XN"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-467896541e1so587531cf.0
        for <workflows@vger.kernel.org>; Wed, 15 Jan 2025 07:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736955602; x=1737560402; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VK5C9Z4SSv5qoa6iG3PZcKtjJUSQhRy1hMBOhIy9H6w=;
        b=ngNzB1XN+P1sBnWMtawFBXermyJZd4EeVoL6yi4TEZ7eir8o8wolXugiV6K+OXF0mE
         kkMUtDQbJRKw1pmB8G8zwLrnUvbdrzIBNoRIQhQwXyswpLbsKAMSbdMpmcEVWuVnKFl+
         LrP/cIw1+rK0b4L6zCIeT2QL+2tJmUcRZv9VR8dWMCGbS0uRCilGkOPCD6b71MgdjL2j
         ztDldA0a0NxQXTxJNBqdrffKp+tIvNsl6HOtvSNpeWr3yqhPoJyDmHMa85XORB0bWlCK
         ArCttznhpGOospXOLeLPFBM/V1Yz2kgdSCtB69aa462g2qhdTpy+HyJGP2RQw4Kgr8S5
         J1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736955602; x=1737560402;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VK5C9Z4SSv5qoa6iG3PZcKtjJUSQhRy1hMBOhIy9H6w=;
        b=as2F9b7OH9k+5K8ZwLPd+WK5T+02Z75kC5My8YhsLykaGpsgcbTyYqFXYtE+0QNR3t
         olkLmYLUwbxvyJMkrythcv3JHtHw8gYLjMlWkBMFxM1PoEyUB4e0VN2w+80d/roFI6N0
         RSMjQYCBDENuBoinDA4qzN7TeoevgVFnaGY7xs5+mQztoa5m5gfVPKhEztiDinlbge/c
         nVN/xU8BujJKg7xwh71jxwo+RwIGHQiBfIQ6ZlvC+7EBgH++NKRR3LI5GfJa1EnH+Dxs
         owvUEqA5PJQF63jinvKhmAhBfSuC3AvZDnhKOPob5SW7qtO2AmJymnjMfnHeNDxQwvEF
         3RUg==
X-Forwarded-Encrypted: i=1; AJvYcCXi42atANW85sMMfm8sM2gnLl6m0jqNTBD5Lv6Bs6EFGUfYH3RUndvCz++Fl3W8vq8KwUaZ489AGQk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0a7IlDWiHWbhpB8kiVewL0dws7Ck6YhTzDpbevegU5AOn0SrS
	RjyqSbKfdylRACmhEarCOadt0CUf2Oa58YPJ8DzSHLfef+sRj0wcu3JcRXg5z1ePZGRdgkG9WkY
	UB7IZmnp3SZaWuX0G2nEAROQaHv/vWdmp0n2R
X-Gm-Gg: ASbGncuKlPKmFlA5BeDsb4cQ4yfH6dRL/vcW2p/+H5AewaAunuDQAyHdcZkmJ16DOoH
	3M/ItbMc95TOzjfrbAx5Hxup6wyqyL3Ztiyw/r2LM+M23TlFVOQwgj0Au7Jr6sIFcn7Q=
X-Google-Smtp-Source: AGHT+IHiPAwD2GY4KS2k3Su/muNxjeVOtTA1UJd7oUEZt5zkK5ghp6uednoGYSoIMvfkkjAAno/dN4ugjLrtGd7W79I=
X-Received: by 2002:a05:622a:38c:b0:466:923f:a749 with SMTP id
 d75a77b69052e-46df6fdae6cmr3596681cf.15.1736955602414; Wed, 15 Jan 2025
 07:40:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115-checkpatch-ignore-v2-0-8467750bf713@google.com> <20250115-checkpatch-ignore-v2-2-8467750bf713@google.com>
In-Reply-To: <20250115-checkpatch-ignore-v2-2-8467750bf713@google.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Wed, 15 Jan 2025 16:39:51 +0100
X-Gm-Features: AbW1kvbaxEIAKxA3etaigoOP7oQrhtdIf2zXGyLexzOKf4xwMzIS4SpFYF6dT58
Message-ID: <CA+i-1C38tYSjegs2jd5gXcuUk0ipEU3rPpS3KzA0eSF=RrGumQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] docs: checkpatch: Document checkpatch-ignore feature
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jan 2025 at 16:33, Brendan Jackman <jackmanb@google.com> wrote:
> +1. Configure git to include the `checkpatch-ignore` notes ref in formatted

Argh, make htmldocs just finished (it takes an extremely long time for
me...) and I realised I sent this without checking the docs output.
Turns out backticks aren't the right syntax for .rst.

Will wait for feedback on the actual thing before fixing this.
