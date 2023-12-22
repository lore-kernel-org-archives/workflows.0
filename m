Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E02C23AD
	for <workflows@vger.kernel.org>; Fri, 22 Dec 2023 00:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YPV+TkK0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=fJN/ZFcl/C9dzI1XQxn+L3eyLhYJR6PzTJ1hILl2VD4=; b=YPV+TkK0Cvhe62PTZvETgHi4ed
	ivBVjUnicset3z+1xcVfrl0icy7jmKexy7Z39k6BJLaWAfgRYCxuiTgNUbzy0fq+3kVdNQ5V3SBTd
	yTdw+yUyMExPi6JcFUJ6SBETmwXy3OV0xgAJTnqXVATdMVzhJ6epFJc2G3YFk5fV52xhYQKL9FtZJ
	0QyzpMTYM/cemTRhejLcRk9UQO01PQqtmrifdcs+LDS40Z+beko2ocASCnjl8jM9timUB3w7F6kO2
	xFdIDHgy5+QNcgNr64drZm1IIbU75VZcmaKuf/OQQvEF/U5+3YgJ2dyBmMZOwXQD0ltQ9MvYhV5RC
	C3MreYSg==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rGSzv-004Tg3-0c;
	Fri, 22 Dec 2023 00:02:39 +0000
Message-ID: <c979fb08-2a91-4047-9003-84fa46841d78@infradead.org>
Date: Thu, 21 Dec 2023 16:02:38 -0800
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS, docs/process/howto: Update man-pages'
 maintainer
Content-Language: en-US
To: Alejandro Colomar <alx@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org,
 =?UTF-8?Q?Ahelenia_Ziemia=C5=84ska?= <nabijaczleweli@nabijaczleweli.xyz>,
 Michael Kerrisk <mtk.manpages@gmail.com>
References: <20231221112533.5259-4-alx@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231221112533.5259-4-alx@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 12/21/23 03:26, Alejandro Colomar wrote:
> Michael retired from maintaining the Linux man-pages project in 2021.
> See commit 06e72cb19c74d3b1d661609c698ee26d7b6e4d7e ("CONTRIBUTING,
> README, lsm: Remove mtk as maintainer") in the Linux man-pages
> repository.

commit: https://git.kernel.org/pub/scm/docs/man-pages/man-pages.git/commit/?id=06e72cb19c74d3b1d661609c698ee26d7b6e4d7e

> 
> Reported-by: Ahelenia Ziemiańska <nabijaczleweli@nabijaczleweli.xyz>
> Signed-off-by: Alejandro Colomar <alx@kernel.org>


Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/process/howto.rst | 3 +--
>  MAINTAINERS                     | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/process/howto.rst b/Documentation/process/howto.rst
> index deb8235e20ff..6c73889c98fc 100644
> --- a/Documentation/process/howto.rst
> +++ b/Documentation/process/howto.rst
> @@ -82,8 +82,7 @@ documentation files are also added which explain how to use the feature.
>  When a kernel change causes the interface that the kernel exposes to
>  userspace to change, it is recommended that you send the information or
>  a patch to the manual pages explaining the change to the manual pages
> -maintainer at mtk.manpages@gmail.com, and CC the list
> -linux-api@vger.kernel.org.
> +maintainer at alx@kernel.org, and CC the list linux-api@vger.kernel.org.
>  
>  Here is a list of files that are in the kernel source tree that are
>  required reading:
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 509281e9e169..a59214c48e52 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12745,7 +12745,7 @@ F:	drivers/mailbox/arm_mhuv2.c
>  F:	include/linux/mailbox/arm_mhuv2_message.h
>  
>  MAN-PAGES: MANUAL PAGES FOR LINUX -- Sections 2, 3, 4, 5, and 7
> -M:	Michael Kerrisk <mtk.manpages@gmail.com>
> +M:	Alejandro Colomar <alx@kernel.org>
>  L:	linux-man@vger.kernel.org
>  S:	Maintained
>  W:	http://www.kernel.org/doc/man-pages

-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html
