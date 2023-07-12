Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4387EB64DD
	for <workflows@archiver.kernel.org>; Wed, 12 Jul 2023 16:22:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233380AbjGLQWb (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 12 Jul 2023 12:22:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232202AbjGLQWO (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 12 Jul 2023 12:22:14 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EA9E3581;
        Wed, 12 Jul 2023 09:21:04 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73:8b7:7001:c8aa:b65f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 8BDF530D;
        Wed, 12 Jul 2023 16:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8BDF530D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1689178833; bh=PAP52CoyJ/ur+sjRMcdlwIWxIdlhD9sgN2nc0WI4qzg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=MpsL/mmo++QFiXf+q+/v04s6nRmztSj/Y//AM5qMmdh3p8o6bnMaKmzZdHb3AnNim
         DXTrnn5BKsVJzcNJohFPYuDrOn9MTQZgQ9gwcp8sReqlLAPLE2Zic/cmUjxTqIVylY
         Se3A/sZAsYN6SOaCKO0e+ulw6eTEhY1OG5sDxJfB7L7kwWTk2nAxreeje9O7woSlXS
         Ika3X0Y/2cmC0BVIqnago5KSoCjeZVMVIbgXorp/b+xXl4OeFgzrb8G3noc01cQg1c
         YHqSMOIdI3jwf0qLYytNSeRyDQ22Z1s3bGNqewvUa+TBRqQpN/2Frij9WmOxpC3qtA
         YEgyqtJfkUDzw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     linux-doc@vger.kernel.org, workflows@vger.kernel.org
Subject: Re: [PATCH docs] MAINTAINERS: treat Documentation/maintainer as
 process docs
In-Reply-To: <20230712091154.7ad7561c@kernel.org>
References: <20230712161011.1339829-1-kuba@kernel.org>
 <20230712091154.7ad7561c@kernel.org>
Date:   Wed, 12 Jul 2023 10:20:32 -0600
Message-ID: <87pm4x3xv3.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Jakub Kicinski <kuba@kernel.org> writes:

> On Wed, 12 Jul 2023 09:10:11 -0700 Jakub Kicinski wrote:
>>  F:	Documentation/process/
>> +F:	Documentation/maintainer/
>
> Ugh, and looking at it in the email client I remember that m comes
> before p. I'll send a v2 tomorrow if nobody nacks.

See https://git.kernel.org/linus/c192ac735768 :)

jon
