Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD1DC433FE
	for <workflows@archiver.kernel.org>; Mon, 21 Mar 2022 22:49:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbiCUWvF (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 21 Mar 2022 18:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbiCUWuu (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 21 Mar 2022 18:50:50 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD05A5C36B
        for <workflows@vger.kernel.org>; Mon, 21 Mar 2022 15:30:40 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id y198so829576vsy.10
        for <workflows@vger.kernel.org>; Mon, 21 Mar 2022 15:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uOP6zf7OXa89rQlpA8E7mPX1f0YFwi0VK9lb8Oj0ZNA=;
        b=UcsCNbMABgGeHzV9WHOA7sJSyPaJyfg69suEuAsm82hQu/K3M1jFND75NiQf+RarDt
         Fm5wuRkGxt1amhiKXtceyMibK7OYIohtWeeBb+XxWwETUJWorVpAucC8B9x4aLt9A8gp
         +rlhO7FWZ16gymnqEHbWKzQlv72fyPa3j7eik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uOP6zf7OXa89rQlpA8E7mPX1f0YFwi0VK9lb8Oj0ZNA=;
        b=we+uKogQpR3IThe3MdmKKR2agkkdWQMzHOCi7iLLjgdnRwjtJH8cQrN1pm5hzWLbNX
         pEI2WraNESNJJikYVVwJDM4ahW4tCIKDF/TmyvLsXhKRCkh39Gg899grLKjbqRu259l5
         4886nioY9veIVQE7FUxHmU8u0csENbZMEc2oo577OUw7ZWf57OpgCtH/tA5N+HIBUYCz
         OYJP5p0oJQ8/l5+xmXplOt+lh1X9Eq5TIhvv+Se3p4Lb4btTRpZUTDsXvnTY+cOnWOtJ
         xoN83+m0joPOrYfWvIHZREVXkfrkohT0nN2GFe7Z6rQG2aV+likORAP30sGYFWZRVQ+K
         Zwqw==
X-Gm-Message-State: AOAM533RFKFuWA5CpAIxs1CE6JVgIW92oWp/LE0Sk9FIZO5zP7ItBfuQ
        hMbZoRVIE9XtUow3qAGYFt2XPWSCRCSYlg==
X-Google-Smtp-Source: ABdhPJwItjZP78+WkvwfPTKQ/DA2f2fyRIY3GMtM5kdhQBSNxJA/F1vM1zaIoc/d+izZlkByHnnmNQ==
X-Received: by 2002:a05:6214:202f:b0:432:4810:1b34 with SMTP id 15-20020a056214202f00b0043248101b34mr17456281qvf.35.1647899955425;
        Mon, 21 Mar 2022 14:59:15 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-127.dsl.bell.ca. [216.209.220.127])
        by smtp.gmail.com with ESMTPSA id a14-20020a05620a066e00b0067d36cc5b12sm8014937qkh.87.2022.03.21.14.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 14:59:14 -0700 (PDT)
Date:   Mon, 21 Mar 2022 17:59:13 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Cui Alan <AlanCui4080@outlook.com>
Cc:     "workflows@vger.kernel.org" <workflows@vger.kernel.org>
Subject: Re: How can I post my patch to others
Message-ID: <20220321215913.uvwn3w3ivgdd4m6n@meerkat.local>
References: <OSZP286MB2078DB6CFC4744170871B3A9AD169@OSZP286MB2078.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OSZP286MB2078DB6CFC4744170871B3A9AD169@OSZP286MB2078.JPNP286.PROD.OUTLOOK.COM>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Mon, Mar 21, 2022 at 01:54:37AM +0000, Cui Alan wrote:
> I'm going to post a patch, but I still don't know whatever can I simply post the PATCH to
> others in the "linux-kernel" mailing list. It's said that I can do that to make PATCH examined by
> others. I don't want to pollute the main list.

I suggest you follow the tutorial on this page:
https://kernelnewbies.org/FirstKernelPatch

Best regards,
-K
