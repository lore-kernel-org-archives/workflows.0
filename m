Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871E53BBF0;
	Tue, 28 Jan 2025 00:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022797; cv=none; b=tBVGvWeTIzLEZ3YUceDp4JM00xRnNzAszPrONSf9xlQc4SIStzxvjap7H6lfbDZ6CQCwvSptGBWml7Pp10gHDNVmGtE8oLGgvvtOcQLBEkcsaJdOd/+sVb9/yjkHRIDmJEr5o7A4r3VCOqW2HERSoTpcGbTIIOFNJvKhQ+Dsta8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022797; c=relaxed/simple;
	bh=lhhjW4xvN5/JBeiDA+D11vVkCEKozoutHtedahprF+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IfGAt4ARqVLO0WUbOzsOkL2SAJ4JsYPNspgEOIo6Q9m4vrF/zh6V781eJ4tQ8PYeT74iSBBz05FOAqhm7XAYnscDuwsrRjFQR36YIn+t4rgEbZFv8mGNmsWSo9nuN4hb3PYa8GtvM9svNNpfqkYhzKZXmrb9ThDxS7H1JFz8/Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PUuYd/js; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PUuYd/js"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C65DC4AF19;
	Tue, 28 Jan 2025 00:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738022796;
	bh=lhhjW4xvN5/JBeiDA+D11vVkCEKozoutHtedahprF+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PUuYd/jsQG21oCXIUvWXaM+i5S/AFRRfYcDM0Nmtf5pd9XH6kCIyHxASgZ2NQXi8o
	 ocDDJp0o4069shKBMazBjRbQZc5Y5ZYWcM/rrfjMFXWAGwmLlPJz/Jr++1i1ThIBDY
	 aCKSau/eb18BgycvmhRDFWry5YwVetB2P/ymyXXLD0+zOfvN7yOfHFJ+4nlPH0Qcgu
	 VEgDljYtUb7AC1D3jgik17gKbN/VY2OxoXM2L2ykE3xzrEKNzxHcNQI+F/Q74UeK8O
	 XEgozCpHJz0TvJHOnWzWeWhqB/mvwqP9Z+kW7q2k7AnWYHSwKkRf78Fbytufmb6p1r
	 xE0e6r6vCAA8A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tcZ7i-0000000DRMb-21eU;
	Tue, 28 Jan 2025 01:06:34 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [RFC v2 34/38] docs: submit-checklist: Allow creating cross-references for ABI README
Date: Tue, 28 Jan 2025 01:06:23 +0100
Message-ID: <94b906a3806c667e69b41879fe77e100aaedc917.1738020236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738020236.git.mchehab+huawei@kernel.org>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Now that Documentation/ABI is processed by automarkup, let it
generate cross-references for the ABI README file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/process/submit-checklist.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/submit-checklist.rst b/Documentation/process/submit-checklist.rst
index e531dd504b6c..827566872567 100644
--- a/Documentation/process/submit-checklist.rst
+++ b/Documentation/process/submit-checklist.rst
@@ -52,7 +52,7 @@ Provide documentation
 4) All new module parameters are documented with ``MODULE_PARM_DESC()``
 
 5) All new userspace interfaces are documented in ``Documentation/ABI/``.
-   See ``Documentation/ABI/README`` for more information.
+   See Documentation/ABI/README for more information.
    Patches that change userspace interfaces should be CCed to
    linux-api@vger.kernel.org.
 
-- 
2.48.1

