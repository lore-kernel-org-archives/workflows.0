Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA3A22BAB9
	for <workflows@vger.kernel.org>; Mon, 13 Jan 2025 17:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736788320; cv=none; b=bKN/qLIy3lVWdTPBjXncdJe+WDuCWiV6WW22BC7aSwnBoXSEhzroFyhfc9sxjo91p0ZzNHQdNhYZhh0ciSoP4NJRsrRK4lchv3+R11miT5tLshNwM8KBVGLXHApLC3sJ2JJjcse+RskM/krFXT00CfsMsdefslYPmbAfIl/HxzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736788320; c=relaxed/simple;
	bh=fFGMZRcBbMYAXRx+GAT4f+tlfsYIUmoTxc2SmeHoMBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qPwzTEFvCiQuMuEat8YYF4GBazqSzr6zhIcovxlroPyp9LyOuO2fKawVzk/nVkeFNkATyHP66zKvX8/+B0Xs8lGex8ihASBhw9CTygPXjdXYFuaLrLIs6RwvrhuT63DsAKaiq5lB8hHmKLV3GEhu/LOZgBYG7/OdGy7bb1S8YzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x9nvz2V1; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x9nvz2V1"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-467896541e1so502481cf.0
        for <workflows@vger.kernel.org>; Mon, 13 Jan 2025 09:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736788318; x=1737393118; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ImmRHf9zuyLTRiwQMWhBeDJONBL5wnCdnMuLTY0ohsE=;
        b=x9nvz2V1bBeSluO/LQOXQ3ztChcrxAAqQ7pz/jEGYvu+LuqrmbBTFz7EAeI0yNodcb
         yQuHCHTSmTIbkcJutdxBgHYjJJy5zz8Ff8MBoZiSUFnjzzIek1+HiZ/u4eh5Hyd7uNOH
         0iI7TGWHknD7EAAFURg++4xbVzKCnYWBivHKIhJqzOyXwMSBdEzWT6TVJfAC2dlQtaln
         T66eAfTIx5xH6/yHbjvwM5Vmui2SoLLDrO3SdCJaseKjakuGwfEUFQKKPD8nYPnA55hI
         d72h72rHsKBNAF3QOyM90pq+wMeozPGyhCHeP4GkiIGjChyEGclLxxyzzysiKZ5vmBL8
         1w9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736788318; x=1737393118;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImmRHf9zuyLTRiwQMWhBeDJONBL5wnCdnMuLTY0ohsE=;
        b=Wwar/Pxxz5MaELs6k6pzORJ4f1ZFQiOY5VsnGx/EEOf2ijUQdXwQ0Vcr6AoQ1dq3IF
         JwQQ8hNdVx12wwgd7DHi+P3DSC5fLE0khJD7zei0LcvRs0YXiy7OUYbERE9CDeLUEbFC
         tocWLSD6aRD6MYgWWlUPTk3P+VdRx/10ySKfCHnb5bmBs3G8KyXhRgzw+rAkL/ePDUHN
         gRQ7gmfl+avzlVM86BO4+M1/yf2b8wKFyFzS/IuWjw41S907zZzEKwyEaMs6WB0Bsvcu
         K1xQKf48bi6VX/HDPxTJnvpDWzU62/z5VJvntIXrBZUJAQB2F3orX2d0PCDQki7jGgRL
         oaEw==
X-Forwarded-Encrypted: i=1; AJvYcCXukuKKkzBcDZMkhzZm35oXsrf9nxvhwoFkc5/vWAP7b8ALkVqPT53HOvcGwBxw4kxjeGAPLvfrmuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC8BUK0UkOi/qS2g59xyKsMIVmGmSLSwg0N68TdTV780B4Fw17
	F/XSjvhg9LjTZbJsp1yb9LgiYcrrDOjWZJg7AHlFYSYyuiJcocwf1On1Td0UuhTzCKeiwuOYk6F
	y3BC4pp33AK20qKh7XNY3SyEgUuoL1Hblpt9J
X-Gm-Gg: ASbGnctecVtzfkCrnMGQR9g+MVSOuaIol7DMYPdqhQ/P81rtsNQAkWN3PvrA/G5XIZQ
	XxVGVWy4ggFFqyQAllfbXS6IsKlTqXJqYnhBFLFKW910kmdC5Kug530dj34Jx2WxifDxh
X-Google-Smtp-Source: AGHT+IGo3Srs/QzsIp455q7U2BPko5eERA3EW4uDnZfKfluZZyswKr9TsIw1CWFwcHz5vJAcqIfkvNr76jLm2pwYbtE=
X-Received: by 2002:ac8:5a13:0:b0:467:7ef7:88a3 with SMTP id
 d75a77b69052e-46c87e439d1mr11030131cf.16.1736788317341; Mon, 13 Jan 2025
 09:11:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-checkpatch-ignore-v1-0-63a7a740f568@google.com> <Z4U9R2m0xVTRMlkk@casper.infradead.org>
In-Reply-To: <Z4U9R2m0xVTRMlkk@casper.infradead.org>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 13 Jan 2025 18:11:46 +0100
X-Gm-Features: AbW1kvboVADLMkd1llq6zW-djwXEXL2YOxOPJFz5UT3x-Cm7pzvT7WHzKM2MKiE
Message-ID: <CA+i-1C2HfdPuXCNXEwkF20kFWnSnr-7r4-FJXf5czuAuufZkhg@mail.gmail.com>
Subject: Re: [PATCH 0/2] checkpatch: Add support for Checkpatch-ignore patch footer
To: Matthew Wilcox <willy@infradead.org>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Jan 2025 at 17:20, Matthew Wilcox <willy@infradead.org> wrote:
> I think humans should always ignore checkpatch.  It's basically
> worthless.

Do you know of anything better? I guess it's feasible to build
something that's actually good at this job using tree-sitter or
something, maybe it exists. But outside of projects that just enforce
clang-format or whatever, checkpatch.pl is still the best (or perhaps
least bad) thing I've personally experienced.

I won't deny that most error types have only ever presented themselves
to me as noise. But the basic "don't do braces like that" and "you
have a stray space here" stuff has been useful.
