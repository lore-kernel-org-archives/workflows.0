Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EC772610
	for <workflows@vger.kernel.org>; Mon, 22 Dec 2025 03:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766374234; cv=none; b=TpxF8zgCLChZIA790vyKSuqhHnc1RHHYCdXa1bYR2mjACOsQk7dmjcdanvNxI9tcr9O/3IsI9v53jzBWv4oPF6jELwCrV5QNrBuiKei/ylOKAwAPypmh2+UQAajDPL6zCgLymqfSM93jvD/En2074SEWG1Qh/YY7bCwU1p+q9eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766374234; c=relaxed/simple;
	bh=0sEgOjWNYiRpYEbqOkuzrHuh+/Ex8OeQWPYb0COe5JM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lboehxYJHebAOKHSlkF5xDkGgcsF2mR7IitCbGXjlR08uj8AK6ge6LYI58ayftvRYVgbHmxQOqwDoV70xU41Ai+jrdplaV8T/QfAvvyEItONrgJFhBCX95jjZAU2OkWHZBe/bt9HBfIi72YA8Y6Tgd6xeuDzHNklLJPK8l81mZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+PDF8KK; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+PDF8KK"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a3051bc432so5612255ad.3
        for <workflows@vger.kernel.org>; Sun, 21 Dec 2025 19:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766374232; x=1766979032; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=COBSDkeJRHdKZMKtQx7qei9g/N9OMGNmu1xizfhqNYM=;
        b=F+PDF8KKgAkHduP3VPGNWhpLWxkZz0ykZwKbwPTiTwyvx4J/3y8iOKhBgTAdt4EV/l
         giQhTCyeiRz58THOpP5GuyHBvap9PHnflKAO6fsGiJU3QGLUpO/ARF50Wt8XFV+PM6ly
         u348dxLgpmICJJU5XA/n2Crag1PWp13FztQpMFQ3dDyq0lyYhslvLwwj7twre6Cm4XuH
         ZdkR8waivKPr8Ty/L5DHMLlPpcKN2vnLL5U1ih7IrLCchWWaV11uSqF/aioMHtxEuYtu
         LnEsqNanFd0VuXOkcvc7ZqA4UujX3Ku9mn+8BuL7nJOqbw48P31a+qB/kshb4BXoqYdR
         yOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766374232; x=1766979032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=COBSDkeJRHdKZMKtQx7qei9g/N9OMGNmu1xizfhqNYM=;
        b=ZpdDakWW64lotO+V+X/AAWeGJ0BFco1jwAFAwNRSBhLSJHW3kekZJ4b1qaJE/UoGd5
         9IECIilCf42A61jVZ3gNf9KNju5G/U/Ih62WhYQ8de+qV21JbeR/frEzRraD6+FJwQId
         IL+AdEXzrrTV5S0ttGBR3fnGeJRkbPlEkIPoAqyuK2dHYX5BykUnXdhZue06NXU+J+G8
         5mgR5R/L3RX8kuQG9X0lIabdSVCMB5HpY8Q0z3jtRa3M6CtJd4/HHxy/IEdn+kncFTsO
         53S/lYuLT7O6jBQDNhBbWI68K8gOJEu9lrj2QuP/s9GNDtxgPFIpyF/MbE1OeMlgf9/N
         pW2g==
X-Forwarded-Encrypted: i=1; AJvYcCUX1TAdA2Q9n4A2/ZLM9oCs5YO4gjUlqPWDtdPmQ7wwZQZIpeKG7bmHFP9eXYyG5jqF5Ql5rfhq0mY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcNdbmKjYB/kpWpNNvDZ0QGSxnrCk7gttdx1VL9eO1G5cHh6mw
	31ZIMgE9ZCoAVrjq9LwlWjOWcKL/klfhnRReMdDsF2KH21YqsfLLXuSo215AYNPMG5ItFfamYQn
	l6eZLvNxnLEbzBQzQbfftL/7SI8YK/Sk=
X-Gm-Gg: AY/fxX5rYJzQd2u6n4Eo65WLhq4/seKwiQThrara9k3F7imKbET5oOBRClGCylrgrWm
	nu9OmINRju692M/KGeEcCMH+Wy5Rmyknp84pFdWHrhTpe11zdVRBePOZGnESQZUGiEXhBNBOMmE
	esZSppknipXJPCx5/pUKlxiWDgkRG/1UL7uEBkREbK9p1WgJG/ziu5Z0SX3UBs6edwXyLNMGJlp
	2HKDM6KzbAreLmSUf/QVgmsQNU2LLXR/f3yuVWeH/5GfMsEI7VWvCGAJV2q1Tnxa93oLt6quOHm
	uYEH0N1BM+73iTcZWaX81ytyYQ6nMWK1IIDKD9DKJl2bsQtusV6cW6WYgbFNuk9ANgxlut8rD4n
	lWTOXgBsgU3blJhx4IEHJkpY=
X-Google-Smtp-Source: AGHT+IEwHp7GiTxzNjQa+1kWbGxVcf+HWSVN1hKAodz8N06a/N/cWQQAGQMNADFaWCws3ABO/rPUi3ymBQAn595hUMI=
X-Received: by 2002:a05:7300:4f9b:b0:2ac:2b5b:a567 with SMTP id
 5a478bee46e88-2b05ec47be3mr4112576eec.6.1766374231860; Sun, 21 Dec 2025
 19:30:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1766061692.git.gtucker@gtucker.io> <35b951506304b141047812f516fa946a4f1549a1.1766061692.git.gtucker@gtucker.io>
 <3241bbcb-d9c1-49bd-b8a7-610543dfb454@gtucker.io>
In-Reply-To: <3241bbcb-d9c1-49bd-b8a7-610543dfb454@gtucker.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 22 Dec 2025 04:30:19 +0100
X-Gm-Features: AQt7F2p6PVxe3-97y300_XoLgtbOQwn1v4BhwJSxqspmpx2ZlG3l-w_-sXw1ElM
Message-ID: <CANiq72mtqdR0EU9GM6yu1-Rn0V98ZftUA814eY3ue2YH1xdNHw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] scripts: add tool to run containerized builds
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 21, 2025 at 9:19=E2=80=AFPM Guillaume Tucker <gtucker@gtucker.i=
o> wrote:
>
> Another piece of feedback from your v1 review was to add a link to
> the documentation.  As it's not published yet I just mentioned the
> section name here in the v2 - but I can anticipate what the final URL
> will be i.e.:
>
>      https://www.kernel.org/doc/html/latest/dev-tools/container

A docs.kernel.org URL instead may look better?

Cheers,
Miguel
