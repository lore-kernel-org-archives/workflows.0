Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE94B19750B
	for <workflows@vger.kernel.org>; Wed,  2 Oct 2024 13:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727874137; cv=none; b=Ki4oQ5Vy5ckSu9i2sjffHoOKKkrLHV+ewKMDTUtJlnRlX6RnBdC+ogIZ9ytZ4+Yfe9d6IKtZlJLNTzwFJaP1gQWDoDai/YrgvAD/+/1du9xz8g+L3Bs/UK14VmfZrlEPbhzgEaM98LnA7Q1hd9BDFW3jfccvJ3TYoAa96ASnzUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727874137; c=relaxed/simple;
	bh=V6+ZpVKOYtob9yUnS+bSJltLOmlfDPMLjeiE2IeEK+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O7mVxyxDqu8OO9t1D4VG1M2iCJqhEssiqJ/luj13RyqoGHovHgiMy9KQRvWh1oZ5kFOx/FM3Vj3H/FBq600rknxsvla3jojstXrFlIep7O0kTveAOlzbYbSpCh0YKAOGvMXo1RdCMYDhMa8HcLk2vAIUlU4zwGM/P0O4dydF0pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P2A08OY2; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P2A08OY2"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2facf481587so30292551fa.1
        for <workflows@vger.kernel.org>; Wed, 02 Oct 2024 06:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727874134; x=1728478934; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6+ZpVKOYtob9yUnS+bSJltLOmlfDPMLjeiE2IeEK+E=;
        b=P2A08OY2rgft/g10dgu+hU7F62V8IGNH7U0FdXMh5OZaXWElQHrrwa8x+rp6j92VQU
         ZT0c0S5bUiL2VihLsjVy/DOt/0unKfwwyLsx0L3uwZ39E5Ul8KjcI01llsiPoAZs6xb+
         ei9cv+o5Po6JtT7J2heGiK9kpG23onz0dy+9O1T4i3isrO/uDj1AWDxCMc+19kMTU5Mw
         rpKEYLpUUDr8rIgdkoSZ+2ExJ313tdxTBkXpDhfMmK87+1UfGTCPiFFZbiZVV5Z4bV5y
         Agk/Wfp+I34MiFXax84h60Nq3IAXW8+Pvp6aq5/RUXs6gNhokqYnpyC2qT/CB2Y/V3Ui
         35aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874134; x=1728478934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6+ZpVKOYtob9yUnS+bSJltLOmlfDPMLjeiE2IeEK+E=;
        b=fJv5eclp2CAU6I7NK/yPCQbCrwpxB9rv0YY4G+4FdtxGEKxOM6mQzrHW4+iRco45bl
         OrxtCw2IZnNaHGmlvLGe1rVgaG2N8QznFXm3jNroQATL1BtDowl/nAXyQaJO0UACLjN5
         4BNRZM1j/RxxkhxCYqx+HTrbxDIBF1Dx+7GQmgjrAVUsDV/BDUXGdXjbD77lArE+IQcG
         KcX/m4Csd0f8L8v30QtP8GUQQxDW0GkrNFiJj6YL+Uh0cPLP1CLB6F8IeFDYip4vLpyp
         +XYNeW8GRULG4TJriGCATm+fHEW2WKXZaps/5TcmOqFC++3yTry5iQO1y0qjiT/ZfJof
         B6og==
X-Forwarded-Encrypted: i=1; AJvYcCWkJklewizY35rr84jJ+JYxkSWYr1VZKMGHMPnoe3v5YPe3BNUw/idXE/0nwo3M/+hbO257oEhuStw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8pElBu7Kpz/sDn1miwFgY/NtRVvagHsU351U6JNYLGOFl32n6
	d2R4Myypqa7NLNCecw9rbvUCuqeeCoVU+NoXySddLi6iJa6YyTpfCnPVHN+dzYG3pmrZEdlXLAG
	S02Dj06F+2rilTioa7ldQC6uI5pi2HYTDeLZ2EQ==
X-Google-Smtp-Source: AGHT+IE17VRzgHlUxgYGy7U0/MRfvq2+ZgvbaqzRxZ67LxJlM2/ueQxV3YOwhvf1FBPYjEvmw9ciY4+lbofbyCL4t5Y=
X-Received: by 2002:a2e:d02:0:b0:2fa:e0c4:f08b with SMTP id
 38308e7fff4ca-2fae109c4b1mr15001981fa.36.1727874133833; Wed, 02 Oct 2024
 06:02:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925095635.30452-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240925095635.30452-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 2 Oct 2024 15:02:02 +0200
Message-ID: <CACRpkdYLvt-fz2zxEwTeahGkR_iLQzioQTGwUuMc52=E33HnQQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation/process: maintainer-soc: clarify
 submitting patches
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, linux-arm-kernel@lists.infradead.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Will Deacon <will@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Conor Dooley <conor@kernel.org>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 11:56=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Patches for SoCs are expected to be picked up by SoC submaintainers.
> The main SoC maintainers should be addressed only in few cases.
>
> Rewrite the section about maintainer handling to document above
> expectation.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Conor Dooley <conor@kernel.org>
> Cc: Heiko St=C3=BCbner <heiko@sntech.de>

Very nice and to the point document.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
