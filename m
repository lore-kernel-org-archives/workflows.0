Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25B6EB64DA
	for <workflows@archiver.kernel.org>; Wed, 12 Jul 2023 21:32:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231675AbjGLVcQ (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 12 Jul 2023 17:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjGLVcP (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 12 Jul 2023 17:32:15 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4585CCF;
        Wed, 12 Jul 2023 14:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=X5RvNDpha0pXy5z1FbTruBc/+E7AU+Rl+3OdvU1NSjw=; b=QInHJOTDWygtewJArexZLK/bmV
        psP9Q+UJAGh0SrtpoNIvU/LFmi6i5qQl5I9m7XISjIrK+9RSVb5NYZDb5Ec1otdP9vuu2rgrxClKJ
        W+DZ2SIg84jJMDHPnJkD9WOK1slvsPvGFyD8d6HAlaYh+k/akfHxWSqz7xWgpS/aWVUpOdcNIi9+2
        mBvaWLUIXzPQThfwSCYf6E+l0QeB9J4RoF9pYtHcoCj0FRRWTn2otLEvzlcmmPEZaska/Wsc/oFNY
        fDHONKjj4vXh9Yqr5p/yXz6JNWZlAA2Ui+DUnrZM0h3Llm9oILsLMyDxGR4rTCndvM3qZhAvBwhmX
        aUkEbSjQ==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qJhRR-001JNw-1u;
        Wed, 12 Jul 2023 21:32:09 +0000
Message-ID: <c4afe7ca-7d6a-652c-3bfc-1b2c1d58f038@infradead.org>
Date:   Wed, 12 Jul 2023 14:32:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH docs] MAINTAINERS: treat Documentation/maintainer as
 process docs
Content-Language: en-US
To:     Jonathan Corbet <corbet@lwn.net>, Jakub Kicinski <kuba@kernel.org>
Cc:     linux-doc@vger.kernel.org, workflows@vger.kernel.org
References: <20230712161011.1339829-1-kuba@kernel.org>
 <20230712091154.7ad7561c@kernel.org> <87pm4x3xv3.fsf@meer.lwn.net>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87pm4x3xv3.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org



On 7/12/23 09:20, Jonathan Corbet wrote:
> Jakub Kicinski <kuba@kernel.org> writes:
> 
>> On Wed, 12 Jul 2023 09:10:11 -0700 Jakub Kicinski wrote:
>>>  F:	Documentation/process/
>>> +F:	Documentation/maintainer/
>>
>> Ugh, and looking at it in the email client I remember that m comes
>> before p. I'll send a v2 tomorrow if nobody nacks.
> 
> See https://git.kernel.org/linus/c192ac735768 :)
> 
> jon

Ugh, that is sad. :(

-- 
~Randy
