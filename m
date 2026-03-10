Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43333E5EF6;
	Tue, 10 Mar 2026 08:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130470; cv=none; b=PZvf7PWfQJ0AngmjigjaRk3PWf1qUSPvM3cRnejJHNRPS0fvLp76iiVV9MdCFY2d2gArepVz1Mak/B1LfJiGxEGFirU/J9/1xt0oSi8mc5oDUGOgAE+I50LVZZzrLR+a+J9Jyro2tDTfFLkkIEm54KsQbYTpUS5sbYwHQOXGEkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130470; c=relaxed/simple;
	bh=II7xDeyDb8rZ8V8baxQPCPWqwwmcxZxEG38xOW9GOEQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=V8csBDpfNda+WUbh5TjXMK4H5ZubDpWyhKbKdboIN4AIk1h0ZPpoG1Ucj57/e+NNYSoQQTwkAylCKifP/w7IJ2boJWxrX7Bpn4q+9u8b9c2F+P2398VR3VoTi6ViDgG85egCswFusRVe8DOco6negPb+E4hxlW7a/NrOyGE5oiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=M3hv1glX; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="M3hv1glX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=G84E1BFqzDmZlmhqiq+SlF9cM59SN/DfFX3Qxra8O5Y=;
  b=M3hv1glXA0XkkebVoyawLB3dTM3SyLH1ELUwAMZ7JdOpeXAT0544Zm+U
   MYon8+RC2R/iLI0atV48UQgQLYLN5qsLBHoKLff1YG9fNF/Thxh70JvvL
   Twjy3hVnUGSWYir/37bPfvoiDX5XoEeebmIwISMKec7GsNkmJIY4YgkrB
   A=;
X-CSE-ConnectionGUID: g3jONuHpQmisF6aPYpfdCw==
X-CSE-MsgGUID: tz7cn+BsSHqG/Bf0jWEJxA==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.23,111,1770591600"; 
   d="scan'208";a="267018386"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 09:14:27 +0100
Date: Tue, 10 Mar 2026 09:14:26 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Julia Lawall <Julia.Lawall@inria.fr>
cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
    workflows@vger.kernel.org, cocci@inria.fr, 
    Nicolas Palix <nicolas.palix@imag.fr>, 
    Hu Haowen <2023002089@link.tyut.edu.cn>, Alex Shi <alexs@kernel.org>, 
    Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
    linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Federico Vaga <federico.vaga@vaga.pv.it>, 
    Carlos Bilbao <carlos.bilbao@kernel.org>, 
    Avadhut Naik <avadhut.naik@amd.com>, LIU Haoyang <tttturtleruss@gmail.com>
Subject: Re: [cocci] [PATCH] coccinelle: update Coccinelle URL
In-Reply-To: <20260310081112.354802-1-Julia.Lawall@inria.fr>
Message-ID: <7db99952-d1ef-7148-4c8f-1e6ae8f0d875@inria.fr>
References: <20260310081112.354802-1-Julia.Lawall@inria.fr>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8



On Tue, 10 Mar 2026, Julia Lawall wrote:

> The LIP6 URL no longer functions.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> ---
>
> I used the UTF-8 encoding for the email.
> Let me know if this was not the right choice.

OK, this doesn't look good.  Sorry for the noise.  What is the proper
encoding?

thanks,
julia

>
>  Documentation/dev-tools/coccinelle.rst                |    2 +-
>  Documentation/translations/it_IT/process/4.Coding.rst |    3 ++-
>  Documentation/translations/sp_SP/process/4.Coding.rst |    3 ++-
>  Documentation/translations/zh_CN/process/4.Coding.rst |    2 +-
>  Documentation/translations/zh_TW/process/4.Coding.rst |    2 +-
>  5 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/process/4.Coding.rst b/Documentation/translations/zh_CN/process/4.Coding.rst
> index 4cc35d410dbc..a00ad5d6b81e 100644
> --- a/Documentation/translations/zh_CN/process/4.Coding.rst
> +++ b/Documentation/translations/zh_CN/process/4.Coding.rst
> @@ -216,7 +216,7 @@ Documentation/fault-injection/fault-injection.rst???
>  ????????? https://sparse.wiki.kernel.org/index.php/Main_page ?????????,
>  ?????????????????????make??????????????????C=1???????????????????????????
>
> -???Coccinelle????????? :ref:`http://coccinelle.lip6.fr/ <devtools_coccinelle>`
> +???Coccinelle????????? :ref:`https://coccinelle.gitlabpages.inria.fr/website/ <devtools_coccinelle>`
>  ?????????????????????????????????????????????????????????????????????????????????????????????
>  scripts/coccinelle?????????????????????????????????????????????????????????????????????
>  ???make coccicheck?????????????????????????????????????????????????????????????????????????????????????????????
> diff --git a/Documentation/translations/zh_TW/process/4.Coding.rst b/Documentation/translations/zh_TW/process/4.Coding.rst
> index e90a6b51fb98..233e8718ed41 100644
> --- a/Documentation/translations/zh_TW/process/4.Coding.rst
> +++ b/Documentation/translations/zh_TW/process/4.Coding.rst
> @@ -219,7 +219,7 @@ Documentation/fault-injection/fault-injection.rst???
>  ????????? https://sparse.wiki.kernel.org/index.php/Main_page ?????????,
>  ?????????????????????make??????????????????C=1???????????????????????????
>
> -???Coccinelle????????? :ref:`http://coccinelle.lip6.fr/ <devtools_coccinelle>`
> +???Coccinelle????????? :ref:`https://coccinelle.gitlabpages.inria.fr/website/ <devtools_coccinelle>`
>  ?????????????????????????????????????????????????????????????????????????????????????????????
>  scripts/coccinelle?????????????????????????????????????????????????????????????????????
>  ???make coccicheck?????????????????????????????????????????????????????????????????????????????????????????????
> diff --git a/Documentation/translations/it_IT/process/4.Coding.rst b/Documentation/translations/it_IT/process/4.Coding.rst
> index 3126342c4b4a..a2ec35e016b7 100644
> --- a/Documentation/translations/it_IT/process/4.Coding.rst
> +++ b/Documentation/translations/it_IT/process/4.Coding.rst
> @@ -329,7 +329,8 @@ Sparse deve essere installato separatamente (se il vostra distribuzione non
>  lo prevede, potete trovarlo su https://sparse.wiki.kernel.org/index.php/Main_Page);
>  pu?? essere attivato sul codice aggiungendo "C=1" al comando make.
>
> -Lo strumento "Coccinelle" (http://coccinelle.lip6.fr/) ?? in grado di trovare
> +Lo strumento "Coccinelle" (https://coccinelle.gitlabpages.inria.fr/website/)
> +?? in grado di trovare
>  una vasta variet?? di potenziali problemi di codifica; e pu?? inoltre proporre
>  soluzioni per risolverli.  Un buon numero di "patch semantiche" per il kernel
>  sono state preparate nella cartella scripts/coccinelle; utilizzando
> diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/dev-tools/coccinelle.rst
> index c714780d458a..05614c469b47 100644
> --- a/Documentation/dev-tools/coccinelle.rst
> +++ b/Documentation/dev-tools/coccinelle.rst
> @@ -34,7 +34,7 @@ of many distributions, e.g. :
>
>  Some distribution packages are obsolete and it is recommended
>  to use the latest version released from the Coccinelle homepage at
> -http://coccinelle.lip6.fr/
> +https://coccinelle.gitlabpages.inria.fr/website
>
>  Or from Github at:
>
> diff --git a/Documentation/translations/sp_SP/process/4.Coding.rst b/Documentation/translations/sp_SP/process/4.Coding.rst
> index 7cc347c34354..6c3750ccdea2 100644
> --- a/Documentation/translations/sp_SP/process/4.Coding.rst
> +++ b/Documentation/translations/sp_SP/process/4.Coding.rst
> @@ -336,7 +336,8 @@ https://sparse.wiki.kernel.org/index.php/Main_Page si su distribuci??n no lo
>  empaqueta); luego, puede ejecutarse en el c??digo agregando "C=1" a su
>  comando make.
>
> -La herramienta "Coccinelle" (http://coccinelle.lip6.fr/) puede encontrar
> +La herramienta "Coccinelle" (https://coccinelle.gitlabpages.inria.fr/website/)
> +puede encontrar
>  una amplia variedad de posibles problemas de codificaci??n; tambi??n puede
>  proponer correcciones para esos problemas. Bastantes "parches sem??nticos"
>  para el kernel se han empaquetado en el directorio scripts/coccinelle;
>
>
