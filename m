Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16C33E557B;
	Wed, 24 Jun 2026 21:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782334981; cv=none; b=LdaX4W7GpZL+btW9I2fqFb90O/IIITXlOE+RO1n/8T7mItoUc3J6F8R1vJ4wSa93V1ndTwSNY9XFnjHYcCH143mt0x9F+KhgopJnVZ7xFP7ir5oY7EOanl55fdZLBhXr1uHPI7NKr/mDH86E0L+AYQ7LsFDA81H3bAAlU3yXdw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782334981; c=relaxed/simple;
	bh=QQBQguuYR/Q2JPyUXGyuWUXz7aKN5n7MLt+DiBdQ/YU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CEod9NWHOwalqqF7LkvPK51kLoQtq7GF7eJh7pBVkKoRsl3WDPA5Wjh3iYZytVsqB1naJUJvrxJNt2PTX1vW1+d+PegFlEjoLIcSEoWySrMPLuEr3DlAroCbD0JAuX8becLlced5XsJcm30y3Jzk4BCvbW9Szqbqtni1RNd2v5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io; spf=pass smtp.mailfrom=gtucker.io; dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b=E6xPGYiX; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gtucker.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gtucker.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gtucker.io header.i=@gtucker.io header.b="E6xPGYiX"
Received: by mail.gandi.net (Postfix) with ESMTPSA id A588C3EE48;
	Wed, 24 Jun 2026 21:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
	t=1782334971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZOPpr/D+Sa0loBCHI9C6UJD0C0O8jNp2wfm1JEgQ+uQ=;
	b=E6xPGYiXoFWLGqRcPCa9+36EY/oNmoBo6yR9Ew3bpnkv5s18nQlP+8Vz6PtUiZJqd2ak4Y
	48ut/jcuswRgVyBxVfbQC5RSQw/TX1Iq2FRD1OxZYYsyq/iBdx23Zjwt1PjYjFR5senPGM
	acmptYzA4a7OU1UqFsPklmKYHJlZjd3nRCPiBPobsMxVnQhZDT0ZGsSPqUtqaDCFOar3nj
	wpq43Ap5tFUFLoS7t/CNBw8YbgL9KhWgEyi2+23f3e+YBqd8bxIkfa66yjCAxpRLOhrHUe
	l6eNkO9rqFK8xTsewUfr0XkS9xcM3NdHEhYnEcHGGbysd3VBsDmibyGMb5I4xg==
Message-ID: <df2fd6ae-69bd-42e6-bf28-ad8103b4189f@gtucker.io>
Date: Wed, 24 Jun 2026 23:02:49 +0200
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: dev-tools: scripts/container prefers
 Podman
To: Coiby Xu <coiby.xu@gmail.com>, linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 "open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260624013850.1853171-1-coiby.xu@gmail.com>
Content-Language: en-GB
From: Guillaume Tucker <gtucker@gtucker.io>
Organization: gtucker.io
In-Reply-To: <20260624013850.1853171-1-coiby.xu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTGGKQUwX71CCeTp80C05egm36UumYswRM8grSpuLlzQXLgOD30EJysK6ew9uLG6HYvOFPfwfLXnkBsGjNQe4CXNoi9KSDkm5onS/G7RYTbF7+bVGpDIpr/RmCHqhkXXhtX8P1H6cJK2W1RanOTuPNmia1RUTMSsD/iptcUKqO1a2Zhgy29fXamYIMVrb8117ZGA7Ie7vueawtqrDxGqR64sCjvXbCq3Lc0e9Dq/Om5wtAyelAe98md4AQBFSZkGPFHnv8Il75svYWZhNPEOMF7OK1k76pC0s/dFmy3xZCrqCgf+xjYdGGTUrj+Z9EHtSsWFnCSmflh++lTZT9MR0rRqlQ+3+5uPHQqzqaR011HZPw7qULtOAK004NYsKJo0WC6jmVlGwT5LpefHzdV9Jqioh4DSOv3h0Oe1E6o4nhOzCctn+AMZYnFJXcmdVbSQOLKlGp2q8rK26ysdKPiaBV4MW6uuElv7adaciiKm0hdOxlRXLuvqWqbmdfVz0jh4eGtQT8pHPguYjSCRarVMjCFQaZUzR8mfQ6uD1fzTdSU9NyBwbjRErj9p7/ohOmRUBvDdM7IDH2h+WVrKaJdL78aX42aYGl4axrjItrpwEB8T2erNZJz0Bq/1KdVV5DLGtL2Xrr0Ia0i2+XpkagcoetI7YVb/dHZPLoWUR1Eq+XecFg

Hi Coiby,

On 24/06/2026 03:38, Coiby Xu wrote:
> Obviously scripts/container prefers Podman over Docker. Putting podman
> before docker also makes it consistent with following parts of the doc
> and the help text of the tool.
> 
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> ---
>  Documentation/dev-tools/container.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/dev-tools/container.rst b/Documentation/dev-tools/container.rst
> index 452415b64662..9e23f79d5ae1 100644
> --- a/Documentation/dev-tools/container.rst
> +++ b/Documentation/dev-tools/container.rst
> @@ -40,7 +40,7 @@ Available options:
>  
>  ``-r, --runtime RUNTIME``
>  
> -    Container runtime name.  Supported runtimes: ``docker``, ``podman``.
> +    Container runtime name.  Supported runtimes: ``podman``, ``docker``.
>  
>      If not specified, the first one found on the system will be used
>      i.e. Podman if present, otherwise Docker.
> @@ -75,8 +75,8 @@ working directory and adjust the user and group id as needed.
>  
>  The container image which would typically include a compiler toolchain is
>  provided by the user and selected via the ``-i`` option.  The container runtime
> -can be selected with the ``-r`` option, which can be either ``docker`` or
> -``podman``.  If none is specified, the first one found on the system will be
> +can be selected with the ``-r`` option, which can be either ``podman`` or
> +``docker``.  If none is specified, the first one found on the system will be
>  used while giving priority to Podman.  Support for other runtimes may be added
>  later depending on their popularity among users.
>  

It's a very subtle tweak but it does help avoid some confusion.

Reviewed-by: Guillaume Tucker <gtucker@gtucker.io>

Thanks,
Guillaume

