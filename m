Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B4EC7EE24
	for <workflows@archiver.kernel.org>; Fri,  5 May 2023 19:12:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233524AbjEETMI (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 5 May 2023 15:12:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233516AbjEETMH (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 5 May 2023 15:12:07 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2864C8A65
        for <workflows@vger.kernel.org>; Fri,  5 May 2023 12:12:06 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-5ed99ebe076so20006406d6.2
        for <workflows@vger.kernel.org>; Fri, 05 May 2023 12:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683313925; x=1685905925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C16o67vTtiW5Sj95zSEy8qfd66g68CibYOi8W/wTXeU=;
        b=GZJWOSjq5YLUs3bzramzfp6vQP7hZAvgWOnsYiqq4w6xvhxRqrFhQRZHUgnEm62bb3
         G4QwIWsyqqJzNO+PVSMeILQKktJbQo7vgunwEodsBQ2NF3Wty2UoYDRfDMBLi8m9M7kj
         E8RgtVxaZPKfE17StgMTqjDxe2IsBWXxquuwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683313925; x=1685905925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C16o67vTtiW5Sj95zSEy8qfd66g68CibYOi8W/wTXeU=;
        b=geOpvStdPX6WIOHMpxy2Y2WQ/Tx/OON49gazOj8VUvT+Qi40Um2lAWylEOgVva33JG
         MC9GtXZikAlG8lSYz09TW01Q+IRT92kVfn+yG/Ro2EbaCy0OuMTKyHc8NI/EsnJFL6kR
         +9YXodoMW2wa745DkKNcydh0Viov8gBmdFSsZj/JXtp7wcywsyrcIqqRCtRrJXRw3KiH
         XOahFyNdV6pNktaMJr5t7SwjbezwHYulrRnrpIqFHQuIFe33jSe4Zco9PLsjopQmGQ2f
         pdQN/z1j8mk/+xpEe0rltro6nMk0gVFutPrasOnEYvcSF+FCqxcRo4m7KxFLkdoTHT1E
         3lVA==
X-Gm-Message-State: AC+VfDx4PyRBAtdhJEcoD6MQffFuU6HNoS3UInaYYxSbT+TJbJ8yEiou
        +GnE2GtSJA0ntUZVI2S1Gj3LEA==
X-Google-Smtp-Source: ACHHUZ7anJS/esKCfu8bEz7dpeuCicbGJYMxXFivH/mYdV0Vz+p7cTVrxKczFd82GvVWxH/PLUh20Q==
X-Received: by 2002:a05:6214:27c5:b0:61b:5ca6:b7fb with SMTP id ge5-20020a05621427c500b0061b5ca6b7fbmr4228889qvb.28.1683313924771;
        Fri, 05 May 2023 12:12:04 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id g17-20020a0cdf11000000b006210a12650csm42045qvl.145.2023.05.05.12.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 12:12:04 -0700 (PDT)
Date:   Fri, 5 May 2023 15:12:02 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     workflows@vger.kernel.org, aros@gmx.com,
        linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
        tools@linux.kernel.org, linux@leemhuis.info
Subject: Re: Introducing bugbot
Message-ID: <20230505-lent-swoosh-4897e2@meerkat>
References: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
 <20230505085218.60c62d75@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230505085218.60c62d75@kernel.org>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Fri, May 05, 2023 at 08:52:18AM -0700, Jakub Kicinski wrote:
> > Per our discussion last fall, I've been working on a bridge between bugzilla
> > and public-inbox, which went live in the past few days. It's still a very
> > early release, but it can do the following:
> 
> What about closing the bugs once they had been fixed/triaged/proven
> invalid?

For now, bugbot can look at a branch in a git repo and close bugs when it sees
a matching "Closes:" trailer.

-K
