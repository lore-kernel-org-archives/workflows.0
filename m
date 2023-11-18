Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8972EC54E76
	for <workflows@archiver.kernel.org>; Sat, 18 Nov 2023 23:22:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbjKRXWi (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Sat, 18 Nov 2023 18:22:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbjKRXWh (ORCPT
        <rfc822;workflows@vger.kernel.org>); Sat, 18 Nov 2023 18:22:37 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8903DB6
        for <workflows@vger.kernel.org>; Sat, 18 Nov 2023 15:22:34 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC071C433C8;
        Sat, 18 Nov 2023 23:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700349754;
        bh=dRhlMOMZc7Ynh+zzEWrF7VAnXdYgBqVfroBd0Kd7Sos=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=vGdFQ7FaOy4xdKz5BTNwA6NNCJ5XxGyjM/DjwOke7DlE098ZLfazgXqUKMW/ohXts
         ExxSI9xheSdCn8J0KWZqaulzouLOxrOu6O4M1zY6/CB6kJYI/fvaY8/NbnTfuRsN0Q
         pXKQgDitNSVfBxUtPXONeiv5lXUvtc0TZxEo2RxAgafNCUxqk/dtnX00AyXd1oYCqx
         +FnE6QP9coBcTGPjDZ2oQMwdomm4ANMlWbQAQ7IurFhpu8vLeLKAVUdE3GbZ7eVilj
         377MuK/GqWax7f4ND2jQT5U3ifxjDpkZEaw3tVyCYM99+P4i+0fhETI88takISm5A3
         cznTd38DgJLwg==
Date:   Sat, 18 Nov 2023 15:22:32 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, corbet@lwn.net, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH net] docs: netdev: try to guide people on dealing with
 silence
Message-ID: <20231118152232.787e9ea2@kernel.org>
In-Reply-To: <dd172cac-f530-4874-a4e7-fc8d7676d708@lunn.ch>
References: <20231118172412.202605-1-kuba@kernel.org>
        <dd172cac-f530-4874-a4e7-fc8d7676d708@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Sat, 18 Nov 2023 20:09:43 +0100 Andrew Lunn wrote:
> > +On the other hand, due to the volume of development discussions on netdev
> > +are very unlikely to be reignited after a week of silence.  
> 
> My English parse falls over on 'are', and wants to backtrack and try
> alternatives.
> 
> Maybe:
> 
> On the other hand, due to the volume of development discussions on
> netdev, after a week of silence further discussions are very unlikely
> to occur without prompting.

Hm. The whole "On the other hand, due to".. felt a bit clunky from 
the start, maybe that's the problem? Is this better?

 Generally speaking, the patches get triaged quickly (in less than
 48h). But be patient, if your patch is active in patchwork (i.e. it's
 listed on the project's patch list) the chances it was missed are close to zero.
+
+The high volume of development on netdev makes reviewers move on
+from discussions relatively quickly. New comments and replies 
+are very unlikely to arrive after a week of silence. If patch is
+no longer active in patchwork and the thread went idle for more than
+a week - clarify the next steps and/or post the next version.
