Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LWPIHLKl"
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC650AA;
	Sun,  3 Dec 2023 13:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tEkBw2c3bkAsXdzRKGbLG9mXG5/Csxch4Kwe/Hxkwrg=; b=LWPIHLKliN7X9zRYU5PIGZgZ3S
	YzXxWDEm09s0MY2XZlUAde4UNypDaRpARyR7IQ21X2z5A69LF1Vqp2SNVMIwCsBRM4lKBxYvwgziA
	luA6iCj8ve15oO/ZXfGbPPNLUqscemLO6G7Lxj+O8JDtkauyqOR0UCfLD8EK8EzhVP5bvHYWkpnFa
	8pjsTW784Inr11dV0pwMuU/rEBU3htu/v56EJcFowkrgfs35NUd9OvvhfeLBNC5nQCkwoAylo+w51
	nhMjaq7M20/xXE5IlaOA7kJfgbGgd8PUMOM4tPnzCPmqx2JxLSMaf8WZitN6h1WFZyGrNeA0G2Al3
	XB2npcBA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1r9tkR-0003oA-4y; Sun, 03 Dec 2023 21:11:31 +0000
Date: Sun, 3 Dec 2023 21:11:31 +0000
From: Matthew Wilcox <willy@infradead.org>
To: attreyee-muk <tintinm2017@gmail.com>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Sounds better
Message-ID: <ZWzvA9svbcgraP7Z@casper.infradead.org>
References: <20231203133017.18311-1-tintinm2017@gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231203133017.18311-1-tintinm2017@gmail.com>

On Sun, Dec 03, 2023 at 07:00:18PM +0530, attreyee-muk wrote:
> Hence, sending this patch. Requesting the maintains to have a look at
> it. 

In addition to Greg's comment, after you have made changes to an rst
file, you have to try building the documents again (eg "make htmldocs").
I can see you've introduced a syntax error in this document.

Also, titles do not have a full stop at the end.
