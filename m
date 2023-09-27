Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 762D9E82CAF
	for <workflows@archiver.kernel.org>; Wed, 27 Sep 2023 16:06:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjI0QGn (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 27 Sep 2023 12:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230327AbjI0QGm (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 27 Sep 2023 12:06:42 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D60AB91
        for <workflows@vger.kernel.org>; Wed, 27 Sep 2023 09:06:40 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-692779f583fso8292527b3a.0
        for <workflows@vger.kernel.org>; Wed, 27 Sep 2023 09:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695830800; x=1696435600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J9IMc3CNSZ/gNDCqC4lhFAPbDDxmcPGnDavaaHDUQsA=;
        b=NID/x3BxuTCJ5oDS7YsoDD018qUxclIX0FaDro8paN8kBI1wV/14uGu0sco/3cfdNc
         JgFDeSrfn8+HOKdUVsk3qR2Gkbji7X3vF908ssrm4IQoutqx9b9EooD9mbTALQCqj1Ye
         dRoZ6NEfzQWZ/TfWxIKeERkZoABV1FsGKgD+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695830800; x=1696435600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9IMc3CNSZ/gNDCqC4lhFAPbDDxmcPGnDavaaHDUQsA=;
        b=iqb9yfcKe9VCO8D7/oFAltKotLrYY4OX7APGnkG2h9vJAjqX9jexqreI1SGUYFg3XB
         NvoUdbvPwtMtuuu05w4U9udd/TjhZZY8c+9GUPtxdQomrqPOEsA+hnxHLOtxQtxpIGjM
         Q5S6CYOyGQMOumx/yAvqI2iwQlPEdjnWY64OiI1K2ATvqE+enX7cAjBkoByWXf/nAskc
         rq6UV7XCZE4qrKkOAZE60HQdE2XozeYXg9Osh75oRxSfKjHjdy9ZAkX/Q6JrEZqJtqb+
         bZkuzAAVYqmym/LQYLCa5a84fkEmnMaysogvG+uWQ7IvGMuXQgFWYFRTfeJ3sOTAS2y/
         og8g==
X-Gm-Message-State: AOJu0YzbPuK6sSbbHtQREj1FUzqxJ9etSw21wazD1GA8+8TlOyGeRt14
        RYuaOCBv8g3s+Qu8N/SIW9la/Q==
X-Google-Smtp-Source: AGHT+IH1SofGgSqeNRn8nWrqgolxJTujcJ2tAHFRFhX6dM3k5+HerJ8jwPH2XIz59wXM/wDB99i2YQ==
X-Received: by 2002:a05:6a20:970c:b0:159:cf93:9b50 with SMTP id hr12-20020a056a20970c00b00159cf939b50mr1874284pzc.46.1695830800300;
        Wed, 27 Sep 2023 09:06:40 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id s196-20020a6377cd000000b005789cbd2cacsm11488172pgc.20.2023.09.27.09.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 09:06:39 -0700 (PDT)
Date:   Wed, 27 Sep 2023 09:06:39 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Justin Stitt <justinstitt@google.com>
Cc:     Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        geert@linux-m68k.org, gregkh@linuxfoundation.org,
        workflows@vger.kernel.org, mario.limonciello@amd.com
Subject: Re: [PATCH 1/3] MAINTAINERS: add documentation for D:
Message-ID: <202309270903.D8ED32AE3@keescook>
References: <20230927-get_maintainer_add_d-v1-0-28c207229e72@google.com>
 <20230927-get_maintainer_add_d-v1-1-28c207229e72@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927-get_maintainer_add_d-v1-1-28c207229e72@google.com>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Sep 27, 2023 at 03:19:14AM +0000, Justin Stitt wrote:
> Document what "D:" does.
> 
> This is more or less the same as what "K:" does but only works for patch
> files.
> 
> See [3/3] for more info and an illustrative example.
> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b19995690904..de68d2c0cf29 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -59,6 +59,9 @@ Descriptions of section entries and preferred order
>  	      matches patches or files that contain one or more of the words
>  	      printk, pr_info or pr_err
>  	   One regex pattern per line.  Multiple K: lines acceptable.
> +  D: *Content regex* (perl extended) pattern match patches only.
> +     Usage same as K:.
> +

The "emphasis" tags here are used when rendering:
https://docs.kernel.org/process/maintainers.html

In this case, I assume "D" is inspired by "Diff", so perhaps reword this
to get a proper emphasis hint, and add additional context:

  D: *Diff content regex* (perl extended) pattern match that applies
     only to patches and not entire files (e.g. when using the
     get_maintainers.pl script).


-- 
Kees Cook
