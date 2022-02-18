Return-Path: <workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A397C433EF
	for <workflows@archiver.kernel.org>; Fri, 18 Feb 2022 18:09:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237964AbiBRSJg (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 18 Feb 2022 13:09:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238975AbiBRSJf (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 18 Feb 2022 13:09:35 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A3D65278290
        for <workflows@vger.kernel.org>; Fri, 18 Feb 2022 10:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645207757;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=90wA+Ljm401rFcVaqDYJBbKSJobGWl8KgcSB0NrgsvA=;
        b=S/O0ZQzkiRXktXfgchYKEsFbTfZk7RWzlqOVKecLm6MvJR2FaGWjJjZLd8E5hGRM6XfNTt
        j/VpCNTBw3m2Etc1Ah4L8r7NypmIe59bRQoDoxfICRhcBxRxhQL3BxvvpIJ79I0ea3J4Nq
        w/JJftd6p1askGLhnFFUBJVKEgM9miA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-nqh2RZJtMbqPGikGnshR_w-1; Fri, 18 Feb 2022 13:09:16 -0500
X-MC-Unique: nqh2RZJtMbqPGikGnshR_w-1
Received: by mail-ed1-f69.google.com with SMTP id o5-20020a50c905000000b00410effbf65dso5946913edh.17
        for <workflows@vger.kernel.org>; Fri, 18 Feb 2022 10:09:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:from:subject:content-transfer-encoding;
        bh=90wA+Ljm401rFcVaqDYJBbKSJobGWl8KgcSB0NrgsvA=;
        b=CIsGWVcN6K5/AQ4InKBxtKtFxxYJO+9hYj7wbtBPPktEJOBzwYAzRIgFlfwkh5j9um
         6DFVHE0uSO9k8hRQrt0Fw7theRLUvD6U2u5bgjv2Ji9aLGqUsncua5Co2Qdur9B9C5oe
         e9ws+thKvG9VXmgefbUe4UStli20R0u1z7JZw5uf/P1YJmXmYI7BWt1VuPFC9mxSnL6p
         YIzcCtGJbpfSxFVa1Kn7ThNKdvpjF5EdKgaTzP9iDNxU1Mqrai6SV+yY6job144w3rIS
         C2SwvrrBTEn7mxUwdAOHy7CND2U3Stdea88uCGfWyWj9TIbkzv5xgOSMcT7ipAaMkJLs
         a9FA==
X-Gm-Message-State: AOAM530c2O7m6zUw4902xf+qCoJMXpg1J/Cg4htWMQY41xOKA1BgKNbm
        5gZLVQ+yruBVfK0aFQ+/jBOT70gp/QPwoT5Le0f1U2kfCz7KvwM4vPkxWPGAPI3+WC1LJhDc7AQ
        EDdq+PM7yceAUIQs+KzQuzaSNSEITnGwF9DmqvMORa8FAY1zJXCLmbeT13P6NDA4KwsgUzhaI
X-Received: by 2002:a50:9559:0:b0:410:9f7d:9f68 with SMTP id v25-20020a509559000000b004109f7d9f68mr9204378eda.437.1645207754074;
        Fri, 18 Feb 2022 10:09:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymN/86N6m3lvZn4wZicSQzOGE3LlPP0sX+rxcvCxbagmQnnaAPLOlWjdhfeOmOu3hQ7SIzYQ==
X-Received: by 2002:a50:9559:0:b0:410:9f7d:9f68 with SMTP id v25-20020a509559000000b004109f7d9f68mr9204340eda.437.1645207753698;
        Fri, 18 Feb 2022 10:09:13 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.googlemail.com with ESMTPSA id r10sm2483726ejy.148.2022.02.18.10.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Feb 2022 10:09:13 -0800 (PST)
Message-ID: <9a4360d9-2420-59fd-2490-3b657710db13@redhat.com>
Date:   Fri, 18 Feb 2022 19:09:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
X-Mozilla-News-Host: news://lore.kernel.org:119
Content-Language: en-US
To:     workflows@vger.kernel.org, Fam Zheng <fam@euphon.net>
From:   Paolo Bonzini <pbonzini@redhat.com>
Subject: Patchew is now indexing LKML
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Hi all,

just a small announcement that the patchew.org service is now archiving 
and indexing all patch series coming through LKML.  The main page is at 
https://patchew.org/linux/.

Patchew is not unlike patchwork, in that it will collect and index patch 
series as they appear on a mailing list.  Its functionality also 
overlaps a bit with b4 in that it recognizes and stores various tags 
sent in reply to the patch series, and also links together different 
submissions of the same series.  It has been in use for a few years with 
various virtualization projects (it was created during the patchword 2.x 
stasis), and recently MPTCP has also based its CI on Patchew plus GitHub 
Actions.

The LKML integration is still a bit new and experimental, so it is not 
yet applying the patches to a git tree like it does for other projects 
such as QEMU; this also means that for example it is not yet possible to 
"search by maintainer".  However, the patches are already searchable by 
to/cc, and also available via REST API at 
https://patchew.org/api/v1/projects/12/.

Our hope is to further integrate Patchew with the various mailing list 
workflow tools in the coming months, for example using b4's three-way merge.

The website has some small server-side functionality for users to mark 
series as accepted/rejected, though it lacks something like the 
delegation feature of patchwork.  To use this functionality you'll need 
an account, which right now must be created by myself.  Please contact 
me offlist if you're interested (though by all means reply on the 
mailing list if you want further information on the tool).

Paolo

