Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C1F3093A7
	for <workflows@vger.kernel.org>; Thu,  1 Jan 2026 22:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767306838; cv=none; b=Rt/LJuylAdxfGDFHtDko9EG2BLIspIhR2FZh4WeGyaU2x7u0jxi47CU8upLsFV8TJ7yEu0lV4Vpsz+iFntNd16rUp6I8crkB+iATClImF3jNVP4EbSOd4f11oEqG8+XqrfPJ6SZ0V8jEu2FtfBG8Z5Z2KCJS+3GhrrsP4waSMnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767306838; c=relaxed/simple;
	bh=p3Udg1A7dnizxaYQsat+vi05U+QBftMn1jOjMroxpb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W7i1xj4T1M5a3LAjYvUBSwS83LTP3MKmuxQbwre6xQxldrcnjNYHOYBqC1nMPOAs+tkZdDucKAfvmstUIHbGafSth0jp/O55NUtz4UVv79deIDaXSY6ZxVskqA7QxELuWLu9dzVZ7esWbQYcUhGqXIy5sqME6Ey3X6zL6AEYZhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XfA/ylE0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XfA/ylE0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5BF8C19423
	for <workflows@vger.kernel.org>; Thu,  1 Jan 2026 22:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767306837;
	bh=p3Udg1A7dnizxaYQsat+vi05U+QBftMn1jOjMroxpb8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XfA/ylE0rBJMsHsHb6ff8yDuopWvU4DWAFQ14cRL4adYprFGoZ6OAAYgujbJr2iRJ
	 /W9mjqnqmcymaCygXJQDD8Jy13PzbaGaUMus7/RM/dPVXHoD66dh8krpnwTGJhpUJE
	 LeL1fiWDl4J1t3/xNlRhqkabUe9heSi1kV3WIlNkrHEfawCusZ3sgW6F7Z3NFPlRoj
	 pZ7kCTaM9xH79WT7dVFLW9aGxi6wTgvUsX73CPcde/gFTyxgqMy274JbuHWUnUDzPn
	 /o38PzS3NJsCHWLV6Cfq4dxW9Y/TmUw/dRxpuAj0pUYBxiGrrh0lWPUeQTko31bHDB
	 rJP8UHgTzCx5w==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-78fd6189c88so91484347b3.0
        for <workflows@vger.kernel.org>; Thu, 01 Jan 2026 14:33:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWTxlMxIgSD3VJIgfVjcLigm3+zQC0sd+5xF3RXuFm2s295Z52+xvydWJxytaVWzI+NmoKh7PEt4eo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxlfANrbYQg/ql6Dn5MTlRhzrQPQdQ+9OOQEyqY9SSRhZrTgmn
	5udyrAeNDziDkuDdKU7kdUWRW4Jxz7F8rwAUqgF6uD3ty6ohh3kE8NalFaa9O00BBGwKKMpb5VZ
	ful8YVDPcWJvCFa+NU4y+7U67T/c3iok=
X-Google-Smtp-Source: AGHT+IE8kG0dl6nfZ9rDsSRend9zuK0sDG20K86USLrsvME01KojRh37n5srP/xA0B/lLw7qk1QH4Fud+Fy7MLPqvEw=
X-Received: by 2002:a05:690c:4906:b0:78c:6ae6:3c7c with SMTP id
 00721157ae682-78fb40560a1mr335458777b3.48.1767306837261; Thu, 01 Jan 2026
 14:33:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com> <20251223142726.73417-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251223142726.73417-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Jan 2026 23:33:46 +0100
X-Gmail-Original-Message-ID: <CAD++jLk=9iea0qyDLy9dwmDEZZgkLcjsOPkw31ks=cEQ=qAQ8g@mail.gmail.com>
X-Gm-Features: AQt7F2rNFZ-MkfoJRD3W8h_DCYrEby3OkFKJI49Jsn33edPsbUed2eaZO-9R5iw
Message-ID: <CAD++jLk=9iea0qyDLy9dwmDEZZgkLcjsOPkw31ks=cEQ=qAQ8g@mail.gmail.com>
Subject: Re: [PATCH 2/2] Documentation/process: maintainer-soc: Mark 'make' as commands
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

> Improve readability of the docs by marking 'make dtbs/dtbs_check' as
> shell commands.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
