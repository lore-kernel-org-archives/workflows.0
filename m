Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C623542BC25
	for <workflows@vger.kernel.org>; Thu,  6 Aug 2026 22:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054090; cv=none; b=pjtKCZG+gn7gQiHOHzUHS++DPMKkJemvNj/ZAB3M719DHtaj6OIhUM2cxh7qs2Hz9JynUWmg0A1jyKdliBIPpWSiX7ZAH0uQvTGtXUtGrsExQbZcQ1IRN3l3q6cgzgMCTq3p6JROpOG0l/brLYhJFTvFF3eYdZTcHkOp7b/rpkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054090; c=relaxed/simple;
	bh=Q7N4xLlBIWxo81ItawG5CepKXwZzHPZ98raJQApwEes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rkpe94cyIlP1qsf5bKK4UYu+cFa9AL/VaZpfavlUDFsmf8f0KY52Y+8emwzNjfYrweU4dUf80CifcQKSp7sMa4xqNRLnR0wm0Rl/p1ri1J5IvqVGZgWFziMw0DgRpiiZLvQFJkD2AMG+Bnpy9mXtrB7i4wu611lHZP7qjRG4eu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KcKv+8od; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KcKv+8od"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B42E1F00ACF
	for <workflows@vger.kernel.org>; Thu,  6 Aug 2026 22:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786054088;
	bh=Q7N4xLlBIWxo81ItawG5CepKXwZzHPZ98raJQApwEes=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KcKv+8odgHShJ6+IAS80kIFlyDUrtN9j0njxElbmeCbO9xzZ6eaElKjXhoMz/fu9p
	 pF1eHN4DVmoTeJ+ypwjPIrQqJvrPWvcKTz9E3tyZINV6GqNslh0DhqEPKdXsHDHYgR
	 uPrWi845D2nnNFIyfy1LLVXOJb24HMRNEvI1Qt9oxugEF62wz6kQBRECcTJ9+Nd+gu
	 RucfsEV+usXt/FPndR6yHDheq0/G4l8HSY7rGYnl+WNp4LekBncPVsI/9e4d9EgOnd
	 UtNibRIPgm/wwoF5n9Pwu8MImaVLBMHztrFAZF8PfDLEwkTkmW0p7t1gTzHtjn5i5D
	 tkKuMuTjyPhUA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b01cb18515so2640388e87.2
        for <workflows@vger.kernel.org>; Thu, 06 Aug 2026 15:08:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrJu9x69obvvyO/5KfxLmRls895HQO1o4rxPbh+L8hjFGB4TSjHc6fC2rBJWJWriIymAOxAnV9zr7o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+4ig1l6jT/vRw66po6vVYhlC2Sn/+0QZgg9z1PYGbmApao8Dg
	MjXUmsW5OZKkFKIUAKRpIL9xTq+2Ve8m0tc+4Z3E6EtcptnxWTLCgaVBev+nR4Sf9KlbBwi3zYv
	b+/e2DyWcddeCn6DmA/VeQpIBNBYhgkw=
X-Received: by 2002:a05:6512:3e1f:b0:5ae:c5f0:ef1a with SMTP id
 2adb3069b0e04-5b2f4cdc18dmr2664985e87.50.1786054087347; Thu, 06 Aug 2026
 15:08:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803091740.232536-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260803091740.232536-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 7 Aug 2026 00:07:55 +0200
X-Gmail-Original-Message-ID: <CAD++jL=i5LW-EcbWYqAN65KEKZQsCi6NgcKwiLGm04trfXL9zw@mail.gmail.com>
X-Gm-Features: AUfX_mw8VVtdH_lZi-qOKtX4NutJWCkxj4cbQuE8TCFpBmYysjfroCHFXaMc5U4
Message-ID: <CAD++jL=i5LW-EcbWYqAN65KEKZQsCi6NgcKwiLGm04trfXL9zw@mail.gmail.com>
Subject: Re: [PATCH] Documentation/process: maintainer-soc: Mention
 expectation about dt-check-style
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 11:17=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Any new DTS code should pass dt-check-style 'relaxed' mode without
> warnings and should have addressed most of applicable 'strict' mode
> ones.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Makes sense!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
