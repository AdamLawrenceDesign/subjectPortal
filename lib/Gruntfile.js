module.exports = function(grunt) {
	
    grunt.initConfig(
	{
		pkg: '<json:package.json>',
		
		concat: {
			js : {
				src : [
					'src/js/jquery.jscrollpane.min.js',
					'src/js/jquery.cycle2.js',
					'src/js/ie-placeholder.js',
					'src/js/server-query.js',
					'src/js/index-page.js', 		// INDEX PAGE
					'src/js/packages-page.js',		// PACKAGES PAGE
					'src/js/groups-page.js',		// GROUPS PAGE
					'src/js/contact-validation.js', // CONTACT VALIDATION
					'src/js/downloads-page.js',
					'src/js/to-top.js',
					'src/js/watermark.js',					
					'src/js/build-links.js',
					'src/js/page-style.js',
					'src/js/page-info.js',
					'src/js/page-loaded.js',
					'src/js/menu-ctrls.js',
					'src/js/ie-warning.js',
					'src/js/analytics.js'
				],
				dest : 'prod/project.js'
			}
		},

		uglify: {
			js : {
				src : [
					'prod/project.js'
				],
				dest : 'prod/project.min.js'
			},
		},
		
		sass: {
			dist: {
				options: {
					style: 'expanded'
				},
				files: {
					'prod/screen.css':'src/sass/screen.scss'
				}
			}
		},
		
		watch: {

			// Run Normally 
		  	files: ['src/js/*'],			// , 'src/css/*'	
		  	tasks: ['concat:js', 'uglify:js']	// , 'concat:css', 'cssmin:css'

		  	// No CSS Uglify
		  	// files: ['src/js/*'],			// , 'src/css/*'		
		  	// tasks: ['concat:js']	// , 'concat:css', 'cssmin:css'
			
			// Quick CSS
			/*
			files: ['src/sass/*'],						// , 'src/css/*'		
			tasks: ['sass']								// , 'concat:css', 'cssmin:css'
			*/
		}	
			
    });
	
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-sass')
    grunt.loadNpmTasks('grunt-contrib-watch');

    grunt.registerTask('default', ['watch:files']);
	
};	