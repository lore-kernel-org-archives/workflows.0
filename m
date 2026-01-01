Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC832586C2
	for <workflows@vger.kernel.org>; Thu,  1 Jan 2026 22:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767306817; cv=none; b=cLiuPg87OG7NM0c8yzBempZ5HCVx+T/95yysF2IqwCyjfFzAeB4t5tjKnq2tp62tQNT6XWKh8i/k1CkJJLfqwkY74I2KJNv2HGNdd3PflRfvUHd/Y3NN6hfKIZUt8zqDHGzGeo/CD8LW7jXcRzySi6YX5TzR+JbiEZe2UeoXdkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767306817; c=relaxed/simple;
	bh=UXGKdezBnhqWJT3z28AVcODOOBkRsqGWkgI6uf542F4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OpfAYazRcUc8SjUdhh+BkxXxQZMPD4QGEyG+D9hd+8IZKCUjjAjRx3m1OL9Qr8vMUpccp/2voWe5WovmZAwMKs3l98IAOPjdhAWlAgHFFsRywh9lzLYN819Hd+nih0aqy7uy7LiojPIwfUQBwnnldcZBj2reY/H67MgJcJ30cIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K8BtYGxL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K8BtYGxL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F7A1C19423
	for <workflows@vger.kernel.org>; Thu,  1 Jan 2026 22:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767306817;
	bh=UXGKdezBnhqWJT3z28AVcODOOBkRsqGWkgI6uf542F4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=K8BtYGxL5UrgFaeruJ2bYpsWno6NCzwubi/XDjFvI+iHYbQvO3xnO0Y7wyhj2cCLP
	 VaKgc3w0IX4QpiURYPgms9c4pkzF8tbO1vcMDyjBiUnBRL8v90Jjd/by7AwRJFPhNC
	 YjgEEgIlWtpX14PD2WYaQmPm6VsfJDvCvmPi/pFWu5LWuaBGcjnvxbyDCSguflNbtq
	 VNEjL1IEIzAE2Wf4+e33ukYHmF/6wWLuvhZScRrjR43mYuQq2dp3Nxhbo/NKUeE0NA
	 MG2XkD6FMCKMY5fQWnAdIQG4AnKuPbokMsi6dCmbx6jOG1HNMPe7ucmUeCczCATjh3
	 4INYWRS+JrrrA==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-78c6a53187dso87850047b3.2
        for <workflows@vger.kernel.org>; Thu, 01 Jan 2026 14:33:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUYmHRWGuL1i6819qUOJzxWS4/rxaBZWCw/cAoAnLja5To9qSNJ3QTRn3T3B5azOE3zjGfVpUQqEE0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMlSMDyseJEQQk+dBwA5mdGUV6zyPWlhEjANkcQVHJgfMTi07V
	eNKhPHX6NYGpSn8gOEWD4bhMFpFs72Fub8RcNvg4+AtuB4C8je7jGpLwZ6VUI2kduUTA08AFjqj
	CAqpfYz7sKrCK89gPe20V+GDQWF/mWZk=
X-Google-Smtp-Source: AGHT+IEBLNKuoraxNZDnarHv/8QNfjLvaAF0ad1d03H/wN5pMxpPWQbhNg4O3Lwnms+Q6/yKd55/WFSt9fl6Hz8W+0k=
X-Received: by 2002:a53:bacd:0:b0:63f:b0a3:7400 with SMTP id
 956f58d0204a3-6466a9133c5mr22966072d50.66.1767306816672; Thu, 01 Jan 2026
 14:33:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Jan 2026 23:33:25 +0100
X-Gmail-Original-Message-ID: <CAD++jLnVaeq39ZcNRjjqaXJ-BNGiR8nO3OzG+Fb-Zz7Db_Lfjg@mail.gmail.com>
X-Gm-Features: AQt7F2pNYT3pv7P7qW-qHrpoGWDYRLqHE5UdSIokYzrI55tQFL698Vhw1A_9duc
Message-ID: <CAD++jLnVaeq39ZcNRjjqaXJ-BNGiR8nO3OzG+Fb-Zz7Db_Lfjg@mail.gmail.com>
Subject: Re: [PATCH 1/2] Documentation/process: maintainer-soc: Be more
 explicit about defconfig
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Drew Fustini <fustini@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 3:27=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> It is already documented but people still send noticeable amount of
> patches ignoring the rule - get_maintainers.pl does not work on
> arm64/configs/defconfig or any other shared ARM defconfig.
>
> Be more explicit, that one must not rely on typical/simple approach
> here for getting To/Cc list.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Despite the complaints that the patch does not fix the problem
there is nothing wrong with the patch.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
