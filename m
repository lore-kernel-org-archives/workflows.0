Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A49BCD80C0
	for <workflows@archiver.kernel.org>; Tue, 10 Oct 2023 12:21:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231827AbjJJMVm (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 10 Oct 2023 08:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231794AbjJJMVl (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 10 Oct 2023 08:21:41 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39D77AC;
        Tue, 10 Oct 2023 05:21:40 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C652C433C8;
        Tue, 10 Oct 2023 12:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1696940499;
        bh=MXtBDS8DsESDRSFcfb9fET6a/Rx+2lbVE19xsUW6l00=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F8q9uKv8jPAvcgF3wYpIIW/IJSugKRAoc6f8CERfo49CvRLrolKdSoFgMdcwrdl1z
         wxwhJCBlQsvYDhlheGi0q9KcxnE6aFHMhqpTk5seITkBQZPHckzw9prQV5xwrjzOqf
         HMbgjI/aEfhih2d3Dasm32cZM4JbkQF9q261fLKU=
Date:   Tue, 10 Oct 2023 14:21:37 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Max Kellermann <max.kellermann@ionos.com>
Cc:     linux@roeck-us.net, joe@perches.com,
        Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/process/coding-style.rst: space around
 const/volatile
Message-ID: <2023101025-senorita-boxlike-09a5@gregkh>
References: <20231010101240.992984-1-max.kellermann@ionos.com>
 <2023101025-bungee-carve-2b4b@gregkh>
 <CAKPOu+_x=C=1kpU_j0HoVn=o3PxRk=PH7a6YPeW8du_sQxJMYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKPOu+_x=C=1kpU_j0HoVn=o3PxRk=PH7a6YPeW8du_sQxJMYw@mail.gmail.com>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Oct 10, 2023 at 02:03:25PM +0200, Max Kellermann wrote:
> On Tue, Oct 10, 2023 at 1:37 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > Don't encourage the use of volatile please
> 
> I don't mean to - but I figured IF "volatile" is used (for whatever
> reason, whether correct or not), it should follow the same coding
> style as "const".
> 
> Do you want me to remove mentions of "volatile" (leaving the coding
> style unspecified), or do you want me to add some warning about using
> volatile?

I would recommend just removing the mentions of it here.

thanks,

greg k-h
