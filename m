Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683C01DE8B5;
	Thu, 17 Oct 2024 15:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729179671; cv=none; b=T0wgy+buWipRkeaxrWY1kR4klywmHSPkWLOgZSYYOq9b8yI6faGDA98X4IrBlv33lZVsJZDI9uy8QDXKwULJuvfqEr7eS7IJ+rINtTbmnaa8/Whzs3FFA5yuGEbThSKdvWX5aGOyHcNSNXSgTHDQc+/ZBFT8RypI/ehv96BBQGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729179671; c=relaxed/simple;
	bh=3OtfS+9pjWgMSRx1hX4zM69LB7omqJUVAJX5E2ISKwc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EENhUU8w9EYQREhEIGvYTEeVF0tF2F8D+aqinbsTCCwGkMZrLIQpw/8CeAkIVwv2y+Q2Li7YbZwTgy5EUkmaZj96OJq9VJD2YZV8/04kup4ztxBBSWmSYVN56GFEcLMJSDBw4VQNx4u76FFEMqpahvueryHmueYbWibxp6ZLD9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=q4+UuIux; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="q4+UuIux"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AC72142C26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1729179665; bh=2vTKYvDLIpk92xWltrYyN1gsLxo8fC23LDEQoGs8f8g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=q4+UuIuxmYYYAet+TP5fxIPaIZThwMVfZBmzLh3M9T24mk91iGtkUOVmxBL/oGXpG
	 imz2VFhs0DCP/tQ/JiRYdZF4pOpA97sndPHovoy4TGZDiaU+7rUfZ3jY4T8c6/CYR7
	 8jO6GUN9G08n+PBQbW/ZZRtHvQQ0cqiIYvTcvV8L/e9zlVM2c17zHBl3CfDfVPPl/m
	 /tCziMQXBZo1ewDk7EMH7fivKNzQbdlSGqt3PohXB7tOv5nPKeI60gjaHj0XPrl1md
	 LEh1ZHE33xkOvW51qkc4P8MmzlK5B/jtHqCweFQvD1wklrWMsJMzIsBrTuzJP7B4x1
	 yk7fzh6hCYs6Q==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id AC72142C26;
	Thu, 17 Oct 2024 15:41:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Haoyang Liu <tttturtleruss@hust.edu.cn>, Alexander Potapenko
 <glider@google.com>, Marco Elver <elver@google.com>, Dmitry Vyukov
 <dvyukov@google.com>
Cc: hust-os-kernel-patches@googlegroups.com, Haoyang Liu
 <tttturtleruss@hust.edu.cn>, kasan-dev@googlegroups.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/dev-tools: fix a typo
In-Reply-To: <20241015140159.8082-1-tttturtleruss@hust.edu.cn>
References: <20241015140159.8082-1-tttturtleruss@hust.edu.cn>
Date: Thu, 17 Oct 2024 09:41:04 -0600
Message-ID: <877ca63ffz.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Haoyang Liu <tttturtleruss@hust.edu.cn> writes:

> fix a typo in dev-tools/kmsan.rst
>
> Signed-off-by: Haoyang Liu <tttturtleruss@hust.edu.cn>
> ---
>  Documentation/dev-tools/kmsan.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/kmsan.rst b/Documentation/dev-tools/kmsan.rst
> index 6a48d96c5c85..0dc668b183f6 100644
> --- a/Documentation/dev-tools/kmsan.rst
> +++ b/Documentation/dev-tools/kmsan.rst
> @@ -133,7 +133,7 @@ KMSAN shadow memory
>  -------------------
>  
>  KMSAN associates a metadata byte (also called shadow byte) with every byte of
> -kernel memory. A bit in the shadow byte is set iff the corresponding bit of the
> +kernel memory. A bit in the shadow byte is set if the corresponding bit of the
>  kernel memory byte is uninitialized. Marking the memory uninitialized (i.e.
>  setting its shadow bytes to ``0xff``) is called poisoning, marking it
>  initialized (setting the shadow bytes to ``0x00``) is called unpoisoning.

So I have applied this, since "iff" is clearly confusing to a lot of
readers even iff it's correct.

Thanks,

jon
