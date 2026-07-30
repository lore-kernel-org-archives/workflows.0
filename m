Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411E22571B8;
	Thu, 30 Jul 2026 05:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785390972; cv=none; b=onl0tSgpoFHt3LBvR4y05dJYCydTo1/zoK9LcAmmiAw3PWNkyMlal8Ui6VYHqOJFXQBnK7iH+gWjKtRVot4zwgADvjjrn4PRjvVjF9t7LdAbYvk6mCftdUyoyFyxQIIf0qhygYR3m4pac5QPIuZoZ2cGu8r/q7akMbuWG+K6ED4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785390972; c=relaxed/simple;
	bh=rrDDJpuTyf8xr1DSh0puVYD2N2i8RkgNvZ2iUqLMwcg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EeWhCizUz9xpCO7MMjc5+c1V2Wt2r1mx9pd7bjZPoG4AQtQmOqRn7YgLe+XArtTzS8nZR0QHC4+WhM8ETrRcjKGiApbrYQb0S2reSrPPKa9u78wzz5+fVjMFHzbTqDt9ShRSff7MBBPN6nGQYCgbn7NQnXHRFoyz4yijRYNJ6UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=WF7mHLLp; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="WF7mHLLp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=oA/yM7993V3G7vZ25VVtzm+hcAHQdUmIt636sa9kV+g=;
  b=WF7mHLLph/zwR1UxpHFnq8Z8PHkuD80MbaybtErzb4du2zHw1Itbh0iY
   2SjtHZrQ+hyugs4UWwXX5dnGjLe+BLNYKXJa6WIhzE8S6787JV8tcAVVc
   m5B3jA7zRv2mLVAipJZeimfkMmbWNOrWJfpbAB387gcQ4ZqBGXeX8wvM8
   w=;
X-CSE-ConnectionGUID: oGv6UshCQKGaq6Xq9SGLsw==
X-CSE-MsgGUID: HSZPTjlaRPOP7BjY7HtaYA==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.25,193,1779141600"; 
   d="scan'208";a="153251658"
Received: from 88-188-149-159.subs.proxad.net (HELO hadrien.home) ([88.188.149.159])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 07:56:00 +0200
Date: Thu, 30 Jul 2026 07:55:58 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: =?ISO-2022-JP?Q?=1B$BAj1=3A=3E4=1B=28J_=2F_AIURA=1B$B!$=1B=28JAKIRA?= <akira.aiura.bj@hitachi.com>
cc: "corbet@lwn.net" <corbet@lwn.net>, 
    "Julia.Lawall@inria.fr" <Julia.Lawall@inria.fr>, 
    "maennich@google.com" <maennich@google.com>, 
    "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, 
    "workflows@vger.kernel.org" <workflows@vger.kernel.org>, 
    "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    "cocci@inria.fr" <cocci@inria.fr>, 
    =?ISO-2022-JP?Q?=1B$BE{0fM&2p=1B=28J_=2F_TSUTSUI=1B$B!$=1B=28JYUSUKE?= <yusuke.tsutsui.gt@hitachi.com>, 
    "=?ISO-2022-JP?Q?=1B$B0$8}=40=3F=3BJ=1B=28J_=2F_AGUCHI=1B$B!$=1B=28JSE?=
 =?ISO-2022-JP?Q?IJI?=" <seiji.aguchi.tr@hitachi.com>, 
    "=?ISO-2022-JP?Q?=1B$BLZB=3C=3E-4u=1B=28J_=2F_KIMURA=1B$B!$=1B=28JMASA?=
 =?ISO-2022-JP?Q?KI?=" <masaki.kimura.kz@hitachi.com>, 
    "=?ISO-2022-JP?Q?=1B$B=40FF#2mOB=1B=28J_=2F_SAITOU=1B$B!$=1B=28JMASAKA?=
 =?ISO-2022-JP?Q?ZU?=" <masakazu.saito.jn@hitachi.com>, 
    "=?ISO-2022-JP?Q?=1B$B=3B3FbBgOB=1B=28J_=2F_YAMAUCHI=1B$B!$=1B=28JHIRO?=
 =?ISO-2022-JP?Q?KAZU?=" <hirokazu.yamauchi.hk@hitachi.com>
Subject: Re: [PATCH] coccinelle: update Coccinelle website URL
In-Reply-To: <TYTPR01MB1104567F06F7DA6B366C264A9D5C92@TYTPR01MB11045.jpnprd01.prod.outlook.com>
Message-ID: <c511e35e-ded-839c-c2e9-6774e2e5ac0@inria.fr>
References: <TYTPR01MB1104567F06F7DA6B366C264A9D5C92@TYTPR01MB11045.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-512528533-1785390959=:3901"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-512528533-1785390959=:3901
Content-Type: text/plain; charset=iso-2022-jp



On Thu, 30 Jul 2026, 相浦彰 / AIURA，AKIRA wrote:

>
> The old Coccinelle project URL is no longer available. Replace it with
> the current Coccinelle homepage already referenced by
> Documentation/dev-tools/coccinelle.rst.
>
> Signed-off-by: Akira Aiura <akira.aiura.bj@hitachi.com>

Applied.  Thanks for the update.

julia


> ---
>  Documentation/process/4.Coding.rst | 3 ++-
>  scripts/coccicheck                 | 4 ++--
>  scripts/nsdeps                     | 2 +-
>  3 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/process/4.Coding.rst b/Documentation/process/4.Coding.rst
> index c0f57d0c4f73..c23b9e48ce49 100644
> --- a/Documentation/process/4.Coding.rst
> +++ b/Documentation/process/4.Coding.rst
> @@ -312,7 +312,8 @@ be found at https://sparse.wiki.kernel.org/index.php/Main_Page if your
>  distributor does not package it); it can then be run on the code by adding
>  "C=1" to your make command.
>
> -The "Coccinelle" tool (http://coccinelle.lip6.fr/) is able to find a wide
> +The "Coccinelle" tool
> +(https://coccinelle.gitlabpages.inria.fr/website) is able to find a wide
>  variety of potential coding problems; it can also propose fixes for those
>  problems.  Quite a few "semantic patches" for the kernel have been packaged
>  under the scripts/coccinelle directory; running "make coccicheck" will run
> diff --git a/scripts/coccicheck b/scripts/coccicheck
> index 8dd766009de1..a0a0e0f72bc7 100755
> --- a/scripts/coccicheck
> +++ b/scripts/coccicheck
> @@ -11,7 +11,7 @@ DIR="$(dirname $(readlink -f $0))/.."
>  SPATCH="`which ${SPATCH:=spatch}`"
>
>  if [ ! -x "$SPATCH" ]; then
> -    echo 'spatch is part of the Coccinelle project and is available at http://coccinelle.lip6.fr/'
> +    echo 'spatch is part of the Coccinelle project and is available at https://coccinelle.gitlabpages.inria.fr/website'
>      exit 1
>  fi
>
> @@ -229,7 +229,7 @@ coccinelle () {
>  	echo " in $FILE."
>  	echo ''
>  	echo ' More information about semantic patching is available at'
> -	echo ' http://coccinelle.lip6.fr/'
> +	echo ' https://coccinelle.gitlabpages.inria.fr/website'
>  	echo ''
>
>  	if [ "`sed -ne 's|^//#||p' $COCCI`" ] ; then
> diff --git a/scripts/nsdeps b/scripts/nsdeps
> index a3372166ac01..d4b5ebcc2016 100644
> --- a/scripts/nsdeps
> +++ b/scripts/nsdeps
> @@ -8,7 +8,7 @@ SPATCH_REQ_VERSION="1.0.4"
>  DIR="$(dirname $(readlink -f $0))/.."
>  SPATCH="`which ${SPATCH:=spatch}`"
>  if [ ! -x "$SPATCH" ]; then
> -	echo 'spatch is part of the Coccinelle project and is available at http://coccinelle.lip6.fr/'
> +	echo 'spatch is part of the Coccinelle project and is available at https://coccinelle.gitlabpages.inria.fr/website'
>  	exit 1
>  fi
>
> --
> 2.53.0
>
>
--8323329-512528533-1785390959=:3901--
