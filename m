Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 041C7EB64DA
	for <workflows@archiver.kernel.org>; Fri, 30 Jun 2023 18:39:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233105AbjF3Sj5 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 30 Jun 2023 14:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233186AbjF3Sjs (ORCPT
        <rfc822;workflows@vger.kernel.org>); Fri, 30 Jun 2023 14:39:48 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E2283C30;
        Fri, 30 Jun 2023 11:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688150379; x=1719686379;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=W1F8igfg1KQtk/T7njsoF/8kR9gmYkI12FHGzd5hl8w=;
  b=QfPpUd/87OVQ4PZJXhzZw2p4waBqiq7sedQjBYI3+vzvYmpLJRxM5Lle
   ZmwkdxMdC00VuT40kqG9kCjFvU58ONgebzYVffSY/vTi9e05P8na3F1Xp
   lkaZM62go9bO1jbgwyAgbFEvGut5wNC1kX4aeOBDtiiJV/NW+hS9+iHLx
   1yqdRECN7QpBxA7gMbowblWofowP96QJ/rXaj+2mYdHWPWdsaM2/oyvaP
   bykC6s92nR3dZxDMph1M2h4iWU/Rq9JuvLTnHFHVZv5uyTF8hIRqPjqLN
   Hj+0F2Mf73X4potSBf9Pk6q1Sg0CAfwSHmmqivccKkfpEwKlFL7u4fUz/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="342798788"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="342798788"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 11:39:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="807867415"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="807867415"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Jun 2023 11:39:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 30 Jun 2023 11:39:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 30 Jun 2023 11:39:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 30 Jun 2023 11:39:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MuJOhxJC8Wno/KewbDgNh9pCmLkHsom6zrJcHdhc5RlzcU3Osf5sANJmrl1mcHlF+4qfVKj5jRdYMnhHOrn92a/qvvKr+GfqvCW3HJLlQdYMj02YV2ZYV8/Sttlb7Jd4IeJR3+x0I6VE6gl1H6XTRekNQjeD5YSE/VO034CqLiHVUVRFmiR6rp0B2mFvPwZ9oRvvN8We9OhQmVtSxLyI3PQ1UaPDwlkEikJpUEJZnIvPERzHKM1bz8gLSdGoGCtDQz0mWLxzKwDHpSpvvnzvlBmSMM4lqbhJUyyf3aDDb5XUft+o7LA4Bn0Tmzfv2lf3FEbIBKC4KhGhZkwnjKdQdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4JKHT9vq6o/fUvz8zSrf6l6OB0OfbgzP1ZvBS2dfxlo=;
 b=MEN+cCSgo3wFzjWoi8RSnw2IOaeZEsuQg5WbIxiwQt0akJtZantvZinEY4j/msKWPlhv/6uAGMXRESv2lRcJ4NnHZUIpmjL26+EYUF1zRAS+akZ6qVMWPx9a11W+AvJ14qTb8/iI3uJCEi6t9jeHynMgJMfi1sTgXpiHBhBKXPXQm/VhKVlnC6ULBpRMQZ++t1Bo9B+FI/HKRQTY0u1TTxIQ1/GIWWc/igv1xOZ53Kdur5RV9WTNuLvwx1UhS9wDjK9EOHDctyycPAFWBkaAmMme0waWID3YqiMhBaielBPo4/f4ZuNL+drQxpKqZih0P4JYRE0lC+m2emgdTuQ9YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by MW4PR11MB6886.namprd11.prod.outlook.com (2603:10b6:303:224::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 18:39:21 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::aeb:12b5:6ac9:fab0]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::aeb:12b5:6ac9:fab0%7]) with mapi id 15.20.6500.029; Fri, 30 Jun 2023
 18:39:20 +0000
Date:   Fri, 30 Jun 2023 11:39:16 -0700
From:   Dan Williams <dan.j.williams@intel.com>
To:     Jonathan Corbet <corbet@lwn.net>, Jakub Kicinski <kuba@kernel.org>
CC:     <linux-doc@vger.kernel.org>, <workflows@vger.kernel.org>,
        Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH docs] docs: remove the tips on how to submit patches from
 MAINTAINERS
Message-ID: <649f21546c607_11e6852942e@dwillia2-xfh.jf.intel.com.notmuch>
References: <20230630171550.128296-1-kuba@kernel.org>
 <874jmolty3.fsf@meer.lwn.net>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <874jmolty3.fsf@meer.lwn.net>
X-ClientProxiedBy: MW4PR03CA0350.namprd03.prod.outlook.com
 (2603:10b6:303:dc::25) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|MW4PR11MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aed21fa-f5b2-4e9b-26c0-08db79995118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c2ZBN2WD3z23Es1hxAZXcdgdr7DU+wFSH8YHwQ00+gHaPFhna7dPr5oFU36wsi0NfphzgDvZaeu6k1s+Mke4JoXEQ1uVNALBQ85/vPmjFI4+NEZdvLIFaMV2HqcruBYyY9D7urf8PT4u+M2JczmFtQsC/pybypygeaBIsh5fP7gNYcOYo8XdxHmcaX7SDqCXZ1b9ey2uLSZS1LYKwdsjLrZ8TudezjauD4JeTFlfJoT3R4AN9dMntTQ8rLRyOoWD2FMhhJBbLbELf9+mQNB1ysW7jT2iWxDGfSc7VyYqhGpV3o72QM4NKeHstjI5XxqdfBmSkyYQxatDzsrwE9pTGrKEXTBn6M6vrch4+Enm5JW2tguZ9kc2C961JriXiat7On9XfLNVVQlyIutWaeJzST0/sSDmaGjrQyw8+g5oCpP57szFaqL5sTe8MLIpuampb7Wvuyz5Hio0lpp4JfbKF4iUPmy3bbkcI66BH8AJ2L7BSgtbTasIMc46GvhOHx61l+3k9TysKNWgzICMvmgqeY5WPjPaDQX/9OeyX30D1GGmdncyqKUKdcdNP3uv/hps
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199021)(9686003)(186003)(6506007)(6512007)(26005)(86362001)(82960400001)(38100700002)(83380400001)(6666004)(5660300002)(6486002)(66476007)(66946007)(4326008)(66556008)(316002)(110136005)(41300700001)(478600001)(8936002)(8676002)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?opZBLK3KY/UWVhbkQVaEPl7U1+piwOxlm8MbjPHKe1wVWLomnXFGfxUc0uwa?=
 =?us-ascii?Q?jyJwrUrLbyXWNLRsGf2znXkz3bjp+ALJAfpDl8Vpirnb3jK6+qBQ73PD2Qtc?=
 =?us-ascii?Q?I52CjcYzadgGPepB2qPxbQXycubxSsnOyzIz2Sm4V42iqPIkS08Hgiy2d7Ty?=
 =?us-ascii?Q?ofpW5dxs4iTVjLGBqlxNlHDzOOrhmprdB8DbnbtTEwMVMc14DvIsVel4vUsI?=
 =?us-ascii?Q?Q6ngRNIB/W4rgpOMRzrmlbGNN3OOLKUEmIFzHM4q1A4wUhPxQDubFqjzKmsG?=
 =?us-ascii?Q?zKP13nhTmgJKON9MkvuN2ua7fIPNYapG2oopZq6QanbyXqPoSWOyWVLwye0H?=
 =?us-ascii?Q?00kc9JHE4R7v0a5x75edfVEpixfmj3dmUWI7y67W+Q0OQ6xC5SBn6Sh+nhjv?=
 =?us-ascii?Q?kb14O2wExf9K7j35Rj2A5ZeBQB6PN3ugYHwkvupKBSmtloUAyIkIpj7M2HTW?=
 =?us-ascii?Q?XAKTqCzHFF5OBbHnbpHxQgrc7OFpFJBzk8nGtOoYgb6oxxnTk2i1UJ46I4+f?=
 =?us-ascii?Q?XrsMp2hMIpmcWm2LZgDHCPfr1lYNhZelZrvJzY6WXnVAeA5DUIwkG8ykbRKL?=
 =?us-ascii?Q?++NbHOC0AokZyqbQMoGp1hb5kQL0uWoqaXACtnNdm/EoFRjTb0RXSV3rTtRZ?=
 =?us-ascii?Q?TmWJfHIwOfKZ/1hVBa37n6KcC9gmKmKghK6d+uNUR2NjmSKafIrf3qbkU8pL?=
 =?us-ascii?Q?HauKUexiCKJx6VSK+RvTEktmiAaw5/TWToyLs4CER32jDG6tpDnIm4K81J0p?=
 =?us-ascii?Q?jph2+Eqp3oTF8Ln/2lSl2SWkzSZgIncprBIxfg2og3chuFE99zEIUOketanv?=
 =?us-ascii?Q?VPS1Mr1B20KGlnmM2tZj2rjd53aTzeYSnW85KMPCKqFWeHLoHeXoXF3yezGR?=
 =?us-ascii?Q?RAztVNTJNmxaqpa4kH7aHEdGLTjzz1e33KEDNGVSk9bVRs8y74aU9ToqCJJn?=
 =?us-ascii?Q?glQ/crUE7D6mzFxdt1EuPEjLjCPOIORBJ8Ig8M3VZYZm5esDIhhGenrynx1Y?=
 =?us-ascii?Q?xNJ6tCUTxLIhevf3vTbN753+ZBdvO3f4BAx5k9FvlNyl3YaGq73Ig2swK60o?=
 =?us-ascii?Q?y08Y4OM7N7N6HrTt5441M/V20siupTmY3Qur4gnpN9xdmWs+ZMoDbYahjGXb?=
 =?us-ascii?Q?kz7P01QxtUTczpj7XQboapZ7p1eRWMoa38oXognj3hycLIsIQ5sFR0itqCGO?=
 =?us-ascii?Q?z6iVcqifezrWUxp7X3/dzBC3W+pHvOh2Ot6cYKSVfKnQgUXTLrDrTGutmmv8?=
 =?us-ascii?Q?hRTEnkOvIhdrPfRQd5jI3LZDo0eIMBYiiZ4cprafYL7uwysyErZfiuQYp2xo?=
 =?us-ascii?Q?dpAt+PNLXwMAdf8cQX0ZIf9rwMOOfnkpIGhC+7U/VBDKAgFRr5fvV0XqXnDm?=
 =?us-ascii?Q?Esfpjv366kXZKHg9itYr4zo8oqr/5a3DeIl20laJ3Ee+ATBMwIVziT4M6UdW?=
 =?us-ascii?Q?GwLi4PDNO2nA6J7WSC90kQuRv9YqLjmyl4imY08tj807Ps7GaHa5uEscb9kF?=
 =?us-ascii?Q?qFSz+Updwh/dwSrCUnldr3exytQCDlIBR/0rTvzC09CpmzXT4OgauyfiWaZa?=
 =?us-ascii?Q?HkNeEhGIdTTOHXp4gEEIbGln0xwOy3Ba2QeLO9ODtzethIyeiaiBbuyGuQF8?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aed21fa-f5b2-4e9b-26c0-08db79995118
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 18:39:20.1872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xf6Q0fCBSt6pJTcF8FiIjwCLT9sAp0aZeVGfy1psv+xyOsfU0VT6+hW0RGfe9UXCjBQnHw+MtC/+7NQ5yk7rHJszO7kRthEQiv7BytBAPXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6886
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Jonathan Corbet wrote:
> Jakub Kicinski <kuba@kernel.org> writes:
> 
> > Having "how to submit patches" in MAINTAINTERS seems out of place.
> > We have a whole section of documentation about it, duplication
> > is harmful and a lot of the text looks really out of date.
> >
> > Sections 1, 2 and 4 look really, really old and not applicable
> > to the modern process.
> >
> > Section 3 is obvious but also we have build bots now.
> >
> > Section 5 is a bit outdated (diff -u?!). But I like the part
> > about factoring out shared code, so add that to process docs.
> >
> > Section 6 is unnecessary?
> >
> > Section 7 is covered by more appropriate docs.
> >
> > Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> > ---
> >  Documentation/process/6.Followthrough.rst |  7 ++
> >  MAINTAINERS                               | 80 +----------------------
> >  2 files changed, 9 insertions(+), 78 deletions(-)
> 
> This has been discussed in the past, I'm not sure why we've never done
> it.  I totally agree, and will happily apply this unless somebody
> objects or beats me to it.

It looks good to me,

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
